echo Installing and running speedtest...
sudo apt-get update > /dev/null
sudo apt-get install curl > /dev/null
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash > /dev/null
sudo apt-get install speedtest > /dev/null
speedtest > /tmp/speedtest.log
sudo apt-get remove speedtest -y > /dev/null
sudo rm /etc/apt/sources.list.d/ookla_speedtest-cli.list
sudo rm /etc/apt/keyrings/speedtest-cli-archive-keyring.gpg
clear
cat /tmp/speedtest.log
rm /tmp/speedtest.log
