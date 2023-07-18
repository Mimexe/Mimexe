echo Installing speedtest...
sudo apt-get update > /dev/null
sudo apt-get install curl > /dev/null
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash > /dev/null
sudo apt-get install speedtest > /dev/null
echo Running speedtest...
speedtest > /tmp/speedtest.log
echo Removing speedtest...
sudo apt-get remove speedtest > /dev/null
sudo rm /etc/apt/sources.list.d/ookla_speedtest-cli.list > /dev/null
sudo rm /etc/apt/keyrings/speedtest-cli-archive-keyring.gpg > /dev/null
echo Speedtest Results:
echo < /tmp/speedtest.log
rm /tmp/speedtest.log
