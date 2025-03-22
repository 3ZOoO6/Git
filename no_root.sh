#!/data/data/com.termux/files/usr/bin/bash

# متغيرات بيئة Termux
PKG_MGR="pkg"
PKG_INSTALL="$PKG_MGR install -y"
ANDROID_HOME="$HOME/android-sdk"
JUPYTER_PORT=8888
VNC_PORT=5901
VNC_PASS="TermuxDev@2024"

# ألوان التنسيق
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

divider() {
    echo -e "${CYAN}=======================================${NC}"
}

header() {
    clear
    echo -e "${GREEN}"
    echo "  _____              __  __           "
    echo " |_   _|__ _ __ ___ |  \/  | ___ _ __ "
    echo "   | |/ _ \ '_ \` _ \| |\/| |/ _ \ '__|"
    echo "   | |  __/ | | | | | |  | |  __/ |   "
    echo "   |_|\___|_| |_| |_|_|  |_|\___|_|   "
    echo -e "${NC}"
    divider
}

header
echo -e "${CYAN}[+] بدء إعداد بيئة التطوير المتقدمة في Termux${NC}"
divider

# تحديث وترقية الحزم
echo -e "${GREEN}[+] تحديث النظام...${NC}"
$PKG_INSTALL update
$PKG_INSTALL upgrade

# تثبيت الحزم الأساسية
echo -e "${GREEN}[+] تثبيت الحزم الأساسية...${NC}"
$PKG_INSTALL git gh neovim nano zsh wget curl tmux openssh python rust

# تثبيت بيئة أندرويد
divider
echo -e "${GREEN}[+] إعداد Android SDK & Gradle...${NC}"
$PKG_INSTALL openjdk-17 gradle android-tools

# تنزيل command-line tools لـ Android SDK
mkdir -p $ANDROID_HOME/cmdline-tools
cd $ANDROID_HOME/cmdline-tools
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmdline-tools.zip
unzip cmdline-tools.zip
rm cmdline-tools.zip
mv cmdline-tools latest

# تثبيت مكونات SDK
yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "build-tools;34.0.0" "platforms;android-34"

# إضافة متغيرات البيئة إلى ملف .bashrc
echo 'export ANDROID_HOME="$HOME/android-sdk"' >> ~/.bashrc
echo 'export PATH="$PATH:$ANDROID_HOME/platform-tools"' >> ~/.bashrc
source ~/.bashrc

# إعداد بيئة الذكاء الاصطناعي
divider
echo -e "${GREEN}[+] تثبيت بيئة الذكاء الاصطناعي (Python)...${NC}"
pip install --upgrade pip wheel setuptools
pip install numpy pandas matplotlib seaborn tensorflow torch scikit-learn jupyterlab keras keras-tuner opencv-python

# تكوين Jupyter
divider
echo -e "${GREEN}[+] إعداد Jupyter Lab...${NC}"
echo "alias startjupyter='jupyter lab --ip=0.0.0.0 --port=$JUPYTER_PORT --no-browser --allow-root'" >> ~/.bashrc

# إعداد واجهة XFCE4 وVNC
divider
echo -e "${GREEN}[+] تثبيت واجهة XFCE4 وخدمة VNC...${NC}"
$PKG_INSTALL xfce4 tigervnc
mkdir -p ~/.vnc
echo "$VNC_PASS" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

cat << EOF > ~/.vnc/xstartup
#!/data/data/com.termux/files/usr/bin/bash
unset SESSION_MANAGER
exec startxfce4
EOF

chmod +x ~/.vnc/xstartup
echo "alias startvnc='vncserver -localhost no :1'" >> ~/.bashrc

# إعداد ZSH وOh My Zsh
divider
echo -e "${GREEN}[+] إعداد بيئة Zsh (Oh My Zsh)...${NC}"
chsh -s zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# تجهيز مستند README
divider
echo -e "${GREEN}[+] إنشاء README.md${NC}"
cat << EOF > ~/README.md
# Termux Advanced Development Environment

### المميزات:
- بيئة تطوير أندرويد كاملة (SDK وGradle)
- بيئة ذكاء اصطناعي متكاملة مع Jupyter Lab
- سطح مكتب XFCE عبر VNC
- أدوات برمجية حديثة ومتطورة (Neovim, Zsh, Git)

### أوامر التشغيل:
\`\`\`bash
# تشغيل Jupyter Lab
startjupyter

# تشغيل VNC
startvnc
\`\`\`
EOF

# نهاية السكربت
divider
echo -e "${GREEN}[✓] تم إعداد بيئة التطوير بنجاح!${NC}"
echo -e "${CYAN}معلومات الوصول:${NC}"
echo -e "${CYAN}- Jupyter Lab: http://localhost:$JUPYTER_PORT${NC}"
echo -e "${CYAN}- VNC Server: 127.0.0.1:$VNC_PORT (كلمة المرور: $VNC_PASS)${NC}"
divider
