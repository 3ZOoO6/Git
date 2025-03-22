#!/bin/bash

# تأكد من تشغيل السكربت بصلاحيات الجذر
if [ "$EUID" -ne 0 ]; then
    echo "❗ يرجى تشغيل السكربت بصلاحيات الجذر (sudo)."
    exit 1
fi

# متغيرات البيئة
export DEBIAN_FRONTEND=noninteractive
ANDROID_HOME="/opt/android-sdk"
JUPYTER_PORT=8888
VNC_PORT=5901
VNC_PASS="KaliPhone@2024"

# الألوان
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
NC='\033[0m'

divider() {
    echo -e "${CYAN}==========================================${NC}"
}

header() {
    clear
    echo -e "${GREEN}"
    echo "  _  __     _ _     ____  _                   "
    echo " | |/ /__ _| (_)___|  _ \| |__   ___  _ __   "
    echo " | ' // _\` | | / __| |_) | '_ \ / _ \| '_ \  "
    echo " | . \ (_| | | \__ \  __/| | | | (_) | | | | "
    echo " |_|\_\__,_|_|_|___/_|   |_| |_|\___/|_| |_| "
    echo -e "${NC}"
    divider
}

header
echo -e "${YELLOW}[+] بدء إعداد Kali Linux المتقدمة على الهاتف${NC}"
divider

# تحديث النظام والحزم الأساسية
echo -e "${GREEN}[+] تحديث النظام وتثبيت الحزم الأساسية...${NC}"
apt update -y && apt upgrade -y
apt install -y neovim nano git gh zsh wget curl tmux openssh-server ufw fail2ban

# تفعيل SSH
divider
echo -e "${GREEN}[+] تفعيل خدمة SSH وضبط الأمان...${NC}"
systemctl enable ssh
systemctl start ssh
ufw allow ssh
ufw enable

# تفعيل Fail2Ban
systemctl enable fail2ban
systemctl start fail2ban

# تثبيت Docker وPodman
divider
echo -e "${GREEN}[+] تثبيت Docker وPodman...${NC}"
apt install -y docker.io docker-compose podman
systemctl enable docker
systemctl start docker

# إعداد بيئة تطوير Android
divider
echo -e "${GREEN}[+] إعداد بيئة تطوير Android المتكاملة...${NC}"
apt install -y openjdk-17-jdk gradle android-sdk adb fastboot

# تثبيت SDK من المصادر الرسمية
mkdir -p $ANDROID_HOME/cmdline-tools
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -P /tmp
unzip /tmp/commandlinetools-linux-11076708_latest.zip -d $ANDROID_HOME/cmdline-tools
mv $ANDROID_HOME/cmdline-tools/cmdline-tools $ANDROID_HOME/cmdline-tools/latest

yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --sdk_root=$ANDROID_HOME \
  "platform-tools" "build-tools;34.0.0" "platforms;android-34" "emulator"

echo 'export ANDROID_HOME="/opt/android-sdk"' > /etc/profile.d/android.sh
echo 'export PATH="$PATH:$ANDROID_HOME/platform-tools"' >> /etc/profile.d/android.sh

# إعداد بيئة الذكاء الاصطناعي Python
divider
echo -e "${GREEN}[+] إعداد بيئة Python للذكاء الاصطناعي...${NC}"
apt install -y python3-pip python3-venv libopenblas-dev liblapack-dev build-essential
python3 -m venv /opt/ai-env
source /opt/ai-env/bin/activate
pip install --upgrade pip wheel setuptools numpy pandas matplotlib tensorflow torch keras keras-tuner scikit-learn opencv-python jupyterlab

# تفعيل Jupyter كخدمة
cat <<EOF > /etc/systemd/system/jupyter.service
[Unit]
Description=Jupyter Lab

[Service]
ExecStart=/opt/ai-env/bin/jupyter lab --ip=0.0.0.0 --port=$JUPYTER_PORT --no-browser --allow-root
WorkingDirectory=/root
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable jupyter
systemctl start jupyter

# إعداد XFCE و VNC
divider
echo -e "${GREEN}[+] تثبيت XFCE وVNC Server...${NC}"
apt install -y xfce4 xfce4-goodies tigervnc-standalone-server
mkdir -p ~/.vnc
echo "$VNC_PASS" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

cat <<EOF > ~/.vnc/xstartup
#!/bin/bash
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
exec startxfce4
EOF

chmod +x ~/.vnc/xstartup

cat <<EOF > /etc/systemd/system/vncserver@.service
[Unit]
Description=VNC Server

[Service]
Type=forking
User=root
ExecStart=/usr/bin/vncserver -localhost no :%i
ExecStop=/usr/bin/vncserver -kill :%i

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable vncserver@1.service
systemctl start vncserver@1.service

# Zsh & Oh My Zsh
divider
echo -e "${GREEN}[+] تثبيت Zsh وOh My Zsh...${NC}"
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# إنشاء نقطة استرجاع Backup
divider
echo -e "${GREEN}[+] إنشاء نقطة استرجاع للنظام...${NC}"
tar -czvf /root/kali_setup_backup_$(date +%F).tar.gz /etc /opt /root

# نهاية السكربت
divider
echo -e "${GREEN}[✓] تم إعداد Kali Linux المتقدم بنجاح!${NC}"
echo -e "${CYAN}معلومات الوصول:${NC}"
echo -e "${CYAN}- Jupyter: http://localhost:$JUPYTER_PORT${NC}"
echo -e "${CYAN}- VNC: 127.0.0.1:$VNC_PORT (Password: $VNC_PASS)${NC}"
divider
