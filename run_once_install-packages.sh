{{ if eq .chezmoi.os "linux"}}
{{ if eq .chezmoi.osRelease.name "Ubuntu" -}}
#!/bin/sh
sudo apt update
sudo apt upgrade
sudo apt-get update -y
sudo apt-get install -y gnupg
sudo apt install curl
sudo apt install python3 python3-pip
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev git \
libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
wget curl llvm libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev \
libxml2-dev libxmlsec1-dev libxmlsec1-openssl-dev libxmlsec1-openssl-dev
sudo apt-get install -y python-openssl
sudo apt-get install -y python3-openssl
sudo snap install node --classic
sudo npm install -g yarn
sudo npm install -g n
sudo n install 16.15.1
sudo snap install --edge nvim --classic
sudo update-alternatives --install /usr/bin/vi vi /snap/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /snap/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
{{ end -}}
pip3 install pyenv
pip3 install pyenv
{{ else if eq .chezmoi.os "darwin" -}}
#!/bin/sh
brew install ripgrep
{{ end -}}
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts.git $HOME/.nerdfonts
cd nerdfonts
git sparse-checkout add patched-fonts/Hermit
git sparse-checkout add patched-fonts/Hack
git sparse-checkout add patched-fonts/SourceCodePro
git sparse-checkout add patched-fonts/IBMPlexMono
git sparse-checkout add patched-fonts/Meslo
git sparse-checkout add patched-fonts/UbuntuMono
./install.sh
cd ..
rm -rf nerdfonts
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

