#!/bin/bash -x

KEYCLOAK_VERSIONS=26.1.0 # ending with words gives problems e.g. 26.1.0-test..check again

KEYCLOAK_REPO=$(pwd)

KEYCLOAK_DIR=$KEYCLOAK_REPO/keycloak

if [[ ! -d $KEYCLOAK_DIR ]]; then
    echo $KEYCLOAK_DIR directory does not exist or script is not placed correctly
    echo "Please place this script under the same parent as the cloned keycloak repository"
    exit 1
fi

cd $KEYCLOAK_DIR

./set-version.sh $KEYCLOAK_VERSIONS

# build release without tests which are not required for production envs
./mvnw clean install -DskipTests

echo -e "\nBuild has been completed\n"

cd $KEYCLOAK_DIR/quarkus/container

cp $KEYCLOAK_DIR/quarkus/dist/target/keycloak-$KEYCLOAK_VERSIONS.tar.gz .

echo -e "\nBuilding Keycloak image..\n"

podman build -t registry.preprod.kubeops.net/kubeops/keycloak:$KEYCLOAK_VERSIONS --build-arg KEYCLOAK_VERSION=$KEYCLOAK_VERSIONS .
