sudo apt-get update -y
sudo apt-get purge ngspice -y

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

cd 
cd Downloads/
wget https://sourceforge.net/projects/ngspice/files/ng-spice-rework/38/ngspice-38.tar.gz
tar -zxf ngspice-38.tar.gz
rm ngspice-38.tar.gz
cd ngspice-38/
./configure
make
sudo make install

cd ..
wget https://ngspice.sourceforge.io/model-parameters/basic_models.7z
sudo apt install p7zip
p7zip -d basic_models.7z
rm basic_models.7z

wget https://sanjayvidhyadharan.in/Downloads/tsmc_180_nm/tsmc018.lib
