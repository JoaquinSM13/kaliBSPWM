#!/bin/bash

# ------------------------ BIENVENIDOS ------------------------

# Si al entrar con sudo su -> no aparece el oh-my-posh
# Correr estas lineas como usuario root
# chmod u+rw /root/.poshthemes/*.omp.*
# echo 'eval "$(oh-my-posh init zsh --config ~/.poshthemes/hunk.omp.json)"' >> /root/.zshrc
if [ "$(whoami)" == "root" ]; then
    exit 1
fi
username=$(whoami)
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
cp ~/kaliBSPWM/bspwm_d/bspwmrc ~/.config/bspwm/
chmod +x ~/.config/bspwm/bspwmrc
cp ~/kaliBSPWM/bspwm_d/sxhkdrc ~/.config/sxhkd/

mkdir ~/.config/bspwm/scripts
cp ~/kaliBSPWM/bspwm_d/bspwm_resize ~/.config/bspwm/scripts/
chmod +x ~/.config/bspwm/scripts/bspwm_resize

echo '-----------------------------------------------------------'
echo '--------------------BSPWM CONFIGURADO----------------------'
echo '-----------------------------------------------------------'

sudo apt install libpcre3-dev libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson -y
sudo apt install -y meson picom libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev libpcre3 libpcre3-dev
sudo apt install picom -y
sudo apt install playerctl -y
git clone https://github.com/noctuid/zscroll
cd zscroll
sudo python3 setup.py install

echo '-----------------------------------------------------------'
echo '----------------------PICOM INSTALADO----------------------'
echo '-----------------------------------------------------------'

cp ~/kaliBSPWM/picom_d/picom.conf ~/.config/picom.conf
cd ~/Downloads
git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

echo '-----------------------------------------------------------'
echo '----------------------PICOM COLOCADO-----------------------'
echo '-----------------------------------------------------------'

sudo apt install rofi -y

echo '-----------------------------------------------------------'
echo '----------------------ROFI INSTALADO-----------------------'
echo '-----------------------------------------------------------'

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

sudo -u root mkdir /root/.poshthemes
sudo -u root wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O /root/.poshthemes/themes.zip
sudo -u root unzip /root/.poshthemes/themes.zip -d /root/.poshthemes
sudo -u root chmod u+rw /root/.poshthemes/*.omp.*
sudo -u root echo 'eval "$(oh-my-posh init zsh --config ~/.poshthemes/hunk.omp.json)"' >> /root/.zshrc

echo '-----------------------------------------------------------'
echo '-------------------OH MY POSH INSTALADO--------------------'
echo '-----------------------------------------------------------'

sudo apt install feh -y
mkdir ~/Desktop/images
cp ~/kaliBSPWM/fondoPantalla.jpg ~/Desktop/images/
cp ~/kaliBSPWM/lockScreen.png ~/Desktop/images/

echo '-----------------------------------------------------------'
echo '----------------------FONDO COLOCADO-----------------------'
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
chmod +x ~/.config/polybar/scripts/powermenu
chmod +x ~/.config/polybar/scripts/get_spotify_status.sh
chmod +x ~/.config/polybar/scripts/scroll_spotify_status.sh
chmod +x ~/.config/polybar/launch.sh

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
curl "https://raw.githubusercontent.com/newmanls/rofi-themes-collection/master/themes/spotlight.rasi" >> ~/.config/rofi/themes/spotlight.rasi
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

sudo gzip -d /usr/share/wordlists/rockyou.txt.gz
sudo apt install wmname -y
sudo apt install ranger -y
sudo apt install sublist3r -y
sudo apt install dirsearch -y
sudo apt install seclists -y
sudo apt install tmux -y
sudo apt install gedit -y
sudo apt install gobuster -y
sudo apt install dolphin -y
sudo apt install libreoffice-java-common -y
sudo apt install okular -y

mkdir ~/Downloads/tools
wget https://github.com/RickdeJager/stegseek/releases/download/v0.6/stegseek_0.6-1.deb -P ~/Downloads/tools/ 
sudo apt install ~/Downloads/tools/stegseek_0.6-1.deb -y
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

curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update -y
sudo apt-get install spotify-client -y

echo '-----------------------------------------------------------'
echo '---------------------SPOTIFY INSTALADO---------------------'
echo '-----------------------------------------------------------'

curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps -R
spicetify backup apply
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh

echo '-----------------------------------------------------------'
echo '-------------------SPICETIFY INSTALADO---------------------'
echo '-----------------------------------------------------------'

sudo apt install flameshot -y

echo '-----------------------------------------------------------'
echo '-------------------FLAMESHOT INSTALADO---------------------'
echo '-----------------------------------------------------------'

echo '-----------------------------------------------------------'
echo '------------ALT + A PARA GUARDAR TU TEMA ROFI--------------'
echo '-----------------------------------------------------------'

rofi-theme-selector
exec zsh
