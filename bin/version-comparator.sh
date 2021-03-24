vercomp() {
    if [[ $1 == $2 ]]; then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i = ${#ver1[@]}; i < ${#ver2[@]}; i++)); do
        ver1[i]=0
    done
    for ((i = 0; i < ${#ver1[@]}; i++)); do
        if [[ -z ${ver2[i]} ]]; then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]})); then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]})); then
            return 2
        fi
    done
    return 0
}

UNAME="stangirard"
UPASS="$DOCKER_PASS"
# aquire token
TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'${UNAME}'", "password": "'${UPASS}'"}' https://hub.docker.com/v2/users/login/ | jq -r .token)
# get list of repositories for the user account

# build a list of all images & tags
# get tags for repo
IMAGE_TAGS=$(curl -s -H "Authorization: JWT ${TOKEN}" https://registry.hub.docker.com/v2/repositories/library/alpine/tags/?page_size=200 | jq -r '.results|.[]|.name' | sort -s -t- -k 2,2nr | sort -t. -s -k 1,1nr -k 2,2nr -k 3,3nr -k 4,4nr | cut -d " " -f 1)
echo $IMAGE_TAGS
# build a list of images from tags
for j in ${IMAGE_TAGS}; do
    if [[ $j == *"."* ]]; then
        RELEASE=$(cat VERSION)
        vercomp $RELEASE $j
        if [[ $? -eq 2 ]]; then
            printf $j >VERSION
            NEW_VERSION=$(cat VERSION)
            git add VERSION
            git commit -m "VERSION=${NEW_VERSION}"
            git tag -a "v${NEW_VERSION}" -m "New Alpine Version"
        fi
    fi
done
