export DEBIAN_FRONTEND=noninteractive
apt update
apt install sudo
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata
sudo apt update -y && sudo apt install git aria2 curl wget rsync zip unzip lzma cpio ccache clang -y
sudo apt install python3 -y
sudo ln -sf /usr/bin/python3 /usr/bin/python
git config --global user.name "Sushrut1101"
git config --global user.email "guptasushrut@gmail.com"
git clone https://github.com/akhilnarang/scripts.git ~/scripts
cd ~/scripts
sudo bash setup/android_build_env.sh
cd ~
