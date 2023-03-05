 
username='apollo'

echo'-----------------------------------------------------------'
echo'---------------------ACTUALIZAR SISTEMA--------------------'
echo'-----------------------------------------------------------'

sudo apt update -y
sudo apt upgrade -y
sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y
sudo apt install gedit -y
git clone https://github.com/baskerville/bspwm.git
mv bspwm ~/Descargas
git clone https://github.com/baskerville/sxhkd.git
mv sxhkd ~/Descargas
cd Descargas/bspwm/
make
sudo make install
cd ../sxhkd/
make
sudo make install
sudo apt install bspwm -y