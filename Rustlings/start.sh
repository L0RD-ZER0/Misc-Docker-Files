#!/bin/bash

# install_rustlings() {
#     echo "Installing Rustlings"
#     cd /usr/src
#     echo "Step 1: Updating Rustup"
#     rustup update
#     echo "Step 2: Cloning Rustlings"
#     git clone -b 4.7.1 --depth 1 https://github.com/rust-lang/rustlings
#     cd rustlings
#     echo "Step 3: Installing Rustlings"
#     cargo install --force --path .

#     curl -L https://raw.githubusercontent.com/rust-lang/rustlings/main/install.sh > install.sh
#     chmod +x install.sh
#     cd /usr/src/rustlings
#     source ../install.sh

#     curl -L https://raw.githubusercontent.com/rust-lang/rustlings/main/install.sh | bash -s /usr/src/rustlings
# }

clone_rustlings() {
    echo "Cloning Rustlings"
    cd /usr/src
    git clone -b 4.7.1 --depth 1 https://github.com/rust-lang/rustlings
    cd ./rustlings
}

if [ "$(ls /usr/src/rustlings)" ]
then
    echo "Rustlings ready to use."
else
    # install_rustlings
    clone_rustlings
fi

cd /usr/src/rustlings
exec rustlings "watch"