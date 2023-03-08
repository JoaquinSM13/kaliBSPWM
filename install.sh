#!/bin/bash

# ------------------------ BIENVENIDOS ------------------------
# Reemplazar los 'apollo' por el nombre de usuario de sus maquinas
# ACTUALIZAR EL NOMBRE DEL FIREFOX QUE INSTALEN DE LA PAGINA OFICIAL
# INK = https://www.mozilla.org/es-ES/firefox/new/
# Instalar el firefox en la carpeta Downloads

# Agregar esta linea arriba del todo en ~/.config/bspwm/bspwmrc
# -   wmname LG3D &

username='kali'
firefox_f="firefox-110.0.1.tar.bz2"
HOME="/home/$username"

echo ",-. .-.  .--.  ,-.    ,-.   ,---.      .---. ,---.  .-.  .-.        " 
echo "l l/ /  / /\ \ l l    l(l   l .-.\    ( .-._)l .-.\ l l/\l ll\    /l" 
echo "l l /  / /__\ \l l    (_)   l l-' \    \ \   l l-' )l /  \ l  \  / l" 
echo "l l \  l  __  ll l    l l   l l--. \ _  \ \  l l--' l  /\  l   \/  l" 
echo "l l) \ l l  l)ll '--. l l   l l'-' /( '-'  ) l l    l(/  \ ll \  / l  by JoaquinSM13"
echo "l((_)-'l_l  (_)l( __l''-'   /( '--'  '----'  /(     (_)   \ll l\/l l" 
echo "(_)            (_)         (__)             (__)            '-'  '-'" 

echo '-----------------------------------------------------------'
echo '--------------------ACTUALIZAR SISTEMA---------------------'
echo '-----------------------------------------------------------'

sudo apt update -y
sudo apt upgrade -y

echo '-----------------------------------------------------------'
echo '------------------INSTALANDO DEPENDENCIAS------------------'
echo '-----------------------------------------------------------'

sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y

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
cp ~/kaliBSPWM/lockScreen.png ~/Desktop/$username/images/
echo "feh --bg-fill /home/$username/Desktop/$username/images/fondoPantalla.jpg" >> ~/.config/bspwm/bspwmrc

#https://www.todofondos.net/downloads/fondo-de-pantalla-4k-sol-neon-para-pc/

echo '-----------------------------------------------------------'
echo '----------------------FONDO COLOCADO-----------------------'
echo '-----------------------------------------------------------'

mkdir ~/.config/picom
cp ~/kaliBSPWM/picom_d/picom.conf ~/.config/picom/
echo 'bspc config focus_follows_pointer true' >> ~/.config/bspwm/bspwmrc
echo 'picom --experimental-backend &' >> ~/.config/bspwm/bspwmrc
echo 'bspc config border_width 1.5' >> ~/.config/bspwm/bspwmrc

echo '-----------------------------------------------------------'
echo '----------------------PICOM COLOCADO-----------------------'
echo '-----------------------------------------------------------'

sudo apt install polybar -y
cd ~/Downloads/
git clone https://github.com/VaughnValle/blue-sky.git
sudo cp blue-sky/polybar/fonts/* /usr/share/fonts/truetype/
mkdir -p ~/.config/polybar/
mkdir ~/.config/polybar/scripts/
cp ~/kaliBSPWM/polybar_d/launch.sh ~/.config/polybar/
cp ~/kaliBSPWM/polybar_d/config.ini ~/.config/polybar/
cp ~/kaliBSPWM/polybar_d/scripts/* ~/.config/polybar/scripts/
chmod +x  ~/.config/polybar/scripts/powermenu
chmod +x ~/.config/polybar/launch.sh
echo '$HOME/.config/polybar/launch.sh' >> ~/.config/bspwm/bspwmrc

fc-cache -v

echo '-----------------------------------------------------------'
echo '---------------------POLYBAR COLOCADO----------------------'
echo '-----------------------------------------------------------'

mkdir ~/.config/bin
cp ~/kaliBSPWM/polybar_d/htb_status.sh ~/.config/bin/
cp ~/kaliBSPWM/polybar_d/target_to_hack.sh ~/.config/bin/
chmod +x ~/.config/bin/htb_status.sh
chmod +x ~/.config/bin/target_to_hack.sh

mkdir ~/.config/bin/target
touch ~/.config/bin/target/target.txt
echo 'function settarget(){' >> ~/.zshrc
echo '    ip_address=$1' >> ~/.zshrc
echo '    machine_name=$2' >> ~/.zshrc
echo '    echo "$ip_address $machine_name" > $HOME/.config/bin/target/target.txt' >> ~/.zshrc
echo '}' >> ~/.zshrc


echo '-----------------------------------------------------------'
echo '--------------------POLYBAR MODIFICADO---------------------'
echo '-----------------------------------------------------------'

mkdir -p ~/.config/rofi/themes
cp ~/Downloads/blue-sky/nord.rasi ~/.config/rofi/themes

echo '-----------------------------------------------------------'
echo '-------------------ROFI TEMA DESCARGADO--------------------'
echo '-----------------------------------------------------------'

wget https://github.com/sharkdp/bat/releases/download/v0.22.1/bat_0.22.1_amd64.deb
sudo dpkg -i bat_0.22.1_amd64.deb
echo '#Custom Aliases' >> ~/.zshrc
echo 'alias cat='/bin/bat'' >> ~/.zshrc
echo 'alias catn='/bin/cat'' >> ~/.zshrc
echo 'alias catnl='/bin/bat --paging=never'' >> ~/.zshrc

oupdate-alternatives --config java

sudo apt install wmname -y
sudo apt install ranger -y
sudo apt install gnome-terminal -y
sudo apt install sublist3r -y
sudo apt install tmux -y
sudo apt install gedit -y

mkdir ~/Downloads/tools   
wget https://github.com/carlospolop/PEASS-ng/releases/tag/20230101/linpeas.sh -P ~/Downloads/tools/   
wget https://github.com/carlospolop/PEASS-ng/releases/tag/20230101/winPEASx64.exe -P ~/Downloads/tools/
mv ~/Downloads/tools/winPEASx64.exe ~/Downloads/tools/winpeas.exe

echo '-----------------------------------------------------------'
echo '-----------------HERRAMIENTAS DESCARGADAS------------------'
echo '-----------------------------------------------------------'

sudo apt install i3lock -y

echo '-----------------------------------------------------------'
echo '---------------------I3 Lock INSTALADO---------------------'
echo '-----------------------------------------------------------'

echo '-----------------------------------------------------------'
echo '-------------------INSTALACION FIREFOX---------------------'
echo '-----------------------------------------------------------'

sudo chown $username:$username /opt/

sudo -u $username mv /home/$username/Downloads/$firefox_f /opt/
sudo -u $username tar -xjf /opt/$firefox_f -C /opt/
sudo -u $username rm /opt/$firefox_f

echo '-----------------------------------------------------------'
echo '---------------------FIREFOX INSTALADO---------------------'
echo '-----------------------------------------------------------'

sudo apt install firejail -y

echo '-----------------------------------------------------------'
echo '---------------------FIREJAIL INSTALADO--------------------'
echo '-----------------------------------------------------------'

echo '-----------------------------------------------------------'
echo '------------ALT + A PARA GUARDAR TU TEMA ROFI--------------'
echo '-----------------------------------------------------------'

rofi-theme-selector
exec zsh