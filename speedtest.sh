echo Installing and running speedtest...
sudo apt-get update
sudo apt-get install curl
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt-get install speedtest
speedtest > /tmp/speedtest.log
sudo apt-get remove speedtest -y
sudo rm /etc/apt/sources.list.d/ookla_speedtest-cli.list
sudo rm /etc/apt/keyrings/speedtest-cli-archive-keyring.gpg
sudo apt-get update
clear
cat /tmp/speedtest.log
rm /tmp/speedtest.log
