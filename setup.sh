#!/bin/bash
echo "🚀 جاري تثبيت بيئة Kali Clean Edition..."

# تحديث الحزم الأساسية
apt update && apt upgrade -y

# تثبيت الحزم الضرورية
apt install -y xfce4 xfce4-terminal tightvncserver dbus-x11

# إعداد VNC
mkdir -p ~/.vnc
echo "#!/bin/bash" > ~/.vnc/xstartup
echo "startxfce4 &" >> ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

echo "✅ التثبيت اكتمل! استخدم 'vncserver :1' لبدء الجلسة."

