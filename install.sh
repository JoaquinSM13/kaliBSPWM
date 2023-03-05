 
# Agregar esta linea arriba del todo en ~/.config/bspwm/bspwmrc
# -   wmname LG3D &

username='kali'

echo '-----------------------------------------------------------'
echo '--------------------ACTUALIZAR SISTEMA---------------------'
echo '-----------------------------------------------------------'

#sudo apt update -y
#sudo apt upgrade -y

echo '-----------------------------------------------------------'
echo '------------------INSTALANDO DEPENDENCIAS------------------'
echo '-----------------------------------------------------------'

sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y
sudo apt install gedit -y

echo '-----------------------------------------------------------'
echo '-----------------INSTALANDO BSPWM y SXHDK------------------'
echo '-----------------------------------------------------------'

git clone https://github.com/baskerville/bspwm.git
mv bspwm ~/Downloads
git clone https://github.com/baskerville/sxhkd.git
mv sxhkd ~/Downloads
cd ~/Downloads/bspwm/
make
sudo make install
cd ~/Downloads/sxhkd/
make
sudo make install
sudo apt install bspwm -y

echo '-----------------------------------------------------------'
echo '-----------------BSPWM y SXHDK INSTALADOS------------------'
echo '-----------------------------------------------------------'

mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
#cd ~/Downloads/bspwm/
cp ~/Downloads/bspwm/examples/bspwmrc ~/.config/bspwm/
chmod +x ~/.config/bspwm/bspwmrc
#cd ~/kaliBSPWM
cp ~/kaliBSPWM/bspwm_d/sxhkdrc ~/.config/sxhkd/

mkdir ~/.config/bspwm/scripts
cp ~/kaliBSPWM/bspwm_d/bspwm_resize ~/.config/bspwm/scripts/
chmod +x ~/.config/bspwm/scripts/bspwm_resize

echo '-----------------------------------------------------------'
echo '--------------------BSPWM CONFIGURADO----------------------'
echo '-----------------------------------------------------------'

sudo apt install polybar -y

echo '-----------------------------------------------------------'
echo '--------------------POLYBAR INSTALADO----------------------'
echo '-----------------------------------------------------------'

sudo apt install libpcre3-dev libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson -y
cd ~/Downloads/
git clone https://github.com/ibhagwan/picom.git
cd picom/
git submodule update --init --recursive
meson setup --buildtype=release . build
ninja -C build
sudo ninja -C build install

echo '-----------------------------------------------------------'
echo '----------------------PICOM INSTALADO----------------------'
echo '-----------------------------------------------------------'

sudo apt install rofi -y

echo '-----------------------------------------------------------'
echo '----------------------ROFI INSTALADO-----------------------'
echo '-----------------------------------------------------------'

# EN PRUEBAS

sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip
#Escoger Meslo
oh-my-posh font install
#ingresar el tema que quieres usar en el ~/.zshrc
echo 'eval "$(oh-my-posh init zsh --config ~/.poshthemes/hunk.omp.json)"' >> ~/.zshrc
#comando para ver la terminal con el oh-my-posh
#os.system("exec zsh")

echo '-----------------------------------------------------------'
echo '-------------------OH MY POSH INSTALADO--------------------'
echo '-----------------------------------------------------------'

sudo apt install feh -y
mkdir ~/Desktop/$username ~/Desktop/$username/images
cp ~/kaliBSPWM/fondoPantalla.jpg ~/Desktop/$username/images/
echo "feh --bg-fill /home/$username/Desktop/$username/images/fondoPantalla.jpg" >> ~/.config/bspwm/bspwmrc

#https://www.todofondos.net/downloads/fondo-de-pantalla-4k-sol-neon-para-pc/

echo '-----------------------------------------------------------'
echo '----------------------FONDO COLOCADO-----------------------'
echo '-----------------------------------------------------------'
