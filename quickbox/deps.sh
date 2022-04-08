
apt update

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

apt install python3 -y
apt install python3-pip -y
apt install wget -y
apt install curl -y
apt install vim -y
apt install git -y
apt install pv -y
apt install zip unzip -y

apt install software-properties-common -y 
add-apt-repository ppa:ondrej/php -y 
apt install php7.4 -y
apt install php7.4-curl -y
apt install php7.4-dom -y
apt install php7.4-zip -y

apt install php5.6 -y 
apt install php5.6-curl -y
apt install php5.6-dom -y
apt install php5.6-zip -y 

apt install php8.0 -y
apt install php8.0-curl -y
apt install php8.0-dom -y
apt install php8.0-zip -y
apt install php8.0-mbstring -y

# change versions
# update-alternatives --set php /usr/bin/php5.6

apt install jq -y
apt install gron -y
apt install docker.io -y

pip3 install datadog

wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz
rm go1.16.4.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> /root/.bashrc
echo "alias lzf=\"fzf +s --tac --bind 'enter:select-all+accept' -m\"" >> /root/.bashrc

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install


curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wget https://raw.githubusercontent.com/gh123man/dotfiles/master/.vimrc
mv .vimrc /root

echo "\n" | vim +slient +VimEnter +PlugInstall +qall 

# PHP composer 
wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
mv composer.phar /usr/local/bin/composer
