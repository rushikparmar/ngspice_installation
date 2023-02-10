#!/bin/bash
Log_File=./installation.log


CommandLog () {
author='rushik_parmar'
startdate=$(date)
scriptName='ngspice_64_installation.log'

echo "${author}"
echo "[$startdate]:[INSTALLATION]: This is ${scriptName}, which shows the loging of magic_installation.sh:"

echo "=============================================="
echo "----Basic Update----"
echo "=============================================="
sudo apt-get update -y
sudo apt-get purge ngspice -y

echo "=============================================="
echo "----Toolchain installation----"
echo "=============================================="
sudo apt-get install wget -y
sudo apt-get install git -y

sudo apt install automake -y
sudo apt install libtool -y
sudo apt install libxaw7-dev -y
sudo apt install flex -y
sudo apt install bison -y
sudo apt install libedit-dev -y
sudo apt install libncurses5-dev -y
sudo apt install libz-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc curl -y

echo "=============================================="
echo "----ngspice source file download----"
echo "=============================================="

cd 
cd Downloads/
wget https://sourceforge.net/projects/ngspice/files/ng-spice-rework/38/ngspice-38.tar.gz

echo "=============================================="
echo "----ngspice source file extraction----"
echo "=============================================="

tar -zxf ngspice-38.tar.gz
#rm ngspice-38.tar.gz
cd ngspice-38/

echo "=============================================="
echo "----ngspice installation----"
echo "=============================================="

./configure
make
sudo make install

echo "=============================================="
echo "----Addon library download----"
echo "=============================================="

cd ..
wget https://ngspice.sourceforge.io/model-parameters/basic_models.7z
sudo apt install p7zip -y
p7zip -d basic_models.7z

wget https://sanjayvidhyadharan.in/Downloads/tsmc_180_nm/tsmc018.lib

echo "=============================================="
echo "----Installation Complete----"
echo "=============================================="

} 


CommandLog | tee "${Log_File}"
#ErrorLog "Found error in logic to logging for investigation" | tee "${Log_File}"
	
