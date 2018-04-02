#/bin/bash -ex

sudo yum install -y git

git clone https://github.com/riywo/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
. ~/.bash_profile

sudo yum install -y gcc openssl-devel readline-devel zlib-devel mariadb-devel

anyenv install rbenv
anyenv install ndenv

. ~/.bash_profile

rbenv install 2.4.3
ndenv install v8.11.0

cd /vagrant

gem install bundler
bundle install --without development test

sudo yum install -y mariadb-server
sudo systemctl start mariadb

echo 'export RAILS_ENV=production' >> ~/.bash_profile
echo "export SECRET_KEY_BASE=$(bin/rails secret)" >> ~/.bash_profile
echo 'export RAILS_SERVE_STATIC_FILES=1' >> ~/.bash_profile
