# Build Keycloak Image from GitHub Repository

## 1. Prerequisites
Ensure you have git and JDK 17 (or JDK 21) installed
```shell
#on RHEL machines
sudo dnf install -y git

sudo dnf install-y java-17-openjdk-devel

# check for java version 
java -version
```

## 2. Clone GitHub Repo
```shell
git clone --branch release/26.1 https://github.com/keycloak/keycloak.git
```

## 3. Build Keycloak and Keycloak Image
>**IMP:** Please place the build_keycloak_image.sh script under the same parent as cloned repository.
```shell
chmod +x build_keycloak_image.sh
./build_keycloak_image.sh
```

<!-- **GitHub Remote For References**
```shell
origin  https://github.com/keycloak/keycloak.git (fetch)
origin  https://github.com/keycloak/keycloak.git (push)
``` -->