apt-get update
apt-get install chef
if [ ! -f /vagrant/chefdk.deb ]; then
    curl https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.4.0-1_amd64.deb > /vagrant/chefdk.deb
fi
dpkg -i /vagrant/chefdk.deb
