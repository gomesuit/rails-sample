#/bin/bash -ex

sudo yum install -y git

git clone https://github.com/riywo/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
$SHELL -l

sudo yum install -y gcc openssl-devel readline-devel zlib-devel mariadb-devel

anyenv install rbenv

$SHELL -l

rbenv install 2.4.3

gem install bundler

cd /vagrant

bundle install --without development test

sudo yum install -y mariadb-server
sudo systemctl start mariadb
