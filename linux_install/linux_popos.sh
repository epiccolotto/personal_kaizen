####################################
### INSTALLAZIONE PACCHETTI BASE ###
####################################
# Aggiornamento dei pacchetti
sudo apt update
sudo apt -y upgrade

# Servizio per Modificare e Convertire File Video
sudo apt install -y ffmpeg

# Librerie per Attivare le periferiche su Steam
sudo apt install -y steam-devices

# Pip per Python, Gnome Terminal, CURL e altri pacchetti essenziali
sudo apt install -y python3-pip gnome-terminal curl ca-certificates gnupg wget apt-transport-https filezilla

# Installazione di Texlive e Texstudio
sudo apt install -y texlive-latex-extra texstudio

# Installazione di VLC media player
sudo apt install -y vlc

################
### GAMEPADS ###
################
git clone https://github.com/atar-axis/xpadneo.git
sudo sh ./xpadneo/install.sh
sudo rm -r xpadneo

####################
### DATA SCIENCE ###
####################
sudo pip3 install --upgrade pip
sudo wget https://raw.githubusercontent.com/epiccolotto/personal_kaizen/main/data_science/requirements_dev.txt
sudo pip3 install -r requirements_dev.txt
sudo rm requirements_dev.txt

##################################
### PACCHETTI DI INSTALLAZIONE ###
##################################

# Google Cloud
sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - 
sudo echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list 

# Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$UBUNTU_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Signal Desktop
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | sudo tee /etc/apt/sources.list.d/signal-xenial.list

##########################################
### INSTALLAZIONE PACCHETTI AGGIUNTIVI ###
##########################################

# Aggiorna la lista dei pacchetti
sudo apt -y update

# Installa vari programmi e utilità
sudo apt install -y brave-browser \
    sublime-text code \
    docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose \
    google-cloud-sdk \
    signal-desktop

######################
### PULIZIA FINALE ###
######################
sudo apt -y autoremove