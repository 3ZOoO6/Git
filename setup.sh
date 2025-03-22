#!/bin/bash
# setup.sh
# هذا السكربت يقوم بإعداد بيئة كالي نظيفة خالية من أدوات الاختراق،
# وتثبيت بيئة تطوير متكاملة تشمل تطوير تطبيقات الأندرويد ودعم الذكاء الاصطناعي،
# مع تحسين تجربة المستخدم عبر إعداد بيئة سطح مكتب XFCE4 وخدمات VNC.
#
# ملاحظة: تأكد من تشغيل السكربت بصلاحيات الجذر (root) أو باستخدام sudo.
# يعمل السكربت على توزيعة كالي لينكس (يستخدم apt-get كمدير حزم).

# تعريف متغيرات مدير الحزم
PKG_INSTALL="apt-get install -y"
PKG_REMOVE="apt-get remove -y"
PKG_UPDATE="apt-get update -y"

echo "-----------------------------------------"
echo "تحديث قاعدة بيانات الحزم..."
echo "-----------------------------------------"
$PKG_UPDATE

echo "-----------------------------------------"
echo "تنظيف بيئة كالي من أدوات الاختراق..."
echo "-----------------------------------------"

# قائمة أدوات الاختراق التي سيتم إزالتها
HACKING_TOOLS=(
    metasploit-framework
    nmap
    hydra
    aircrack-ng
    netcat
    # يمكن إضافة أدوات أخرى تعتبرها مرتبطة بالاختراق هنا
)

for tool in "${HACKING_TOOLS[@]}"; do
    if dpkg -l | grep -qw "$tool"; then
        echo "جارٍ إزالة $tool..."
        $PKG_REMOVE "$tool" || echo "تعذر إزالة $tool أو أنه غير مثبت."
    else
        echo "$tool غير مثبت، تخطي..."
    fi
done

echo ""
echo "تنبيه: يُرجى مراجعة /usr/share و /usr/bin يدويًا للتأكد من عدم وجود سكربتات أو ملفات مشبوهة."
echo ""

echo "-----------------------------------------"
echo "إعداد بيئة تطوير الأندرويد..."
echo "-----------------------------------------"

echo "تثبيت OpenJDK، Gradle، Android SDK، adb، fastboot..."
$PKG_INSTALL openjdk-17-jdk gradle android-sdk adb fastboot

# تهيئة sdkmanager إذا كان مثبتًا
if command -v sdkmanager >/dev/null 2>&1; then
    echo "تحديث sdkmanager..."
    sdkmanager --update
else
    echo "sdkmanager غير موجود. تأكد من تثبيت Android SDK بشكل صحيح."
fi

echo ""
echo "-----------------------------------------"
echo "إضافة دعم الذكاء الاصطناعي..."
echo "-----------------------------------------"

$PKG_INSTALL python3 python3-pip

# تحديث pip وتثبيت المكتبات المطلوبة
pip3 install --upgrade pip
pip3 install numpy pandas tensorflow torch scikit-learn jupyter

# إنشاء سكربت لتشغيل Jupyter Notebook بسهولة
echo "إنشاء سكربت تشغيل Jupyter Notebook..."
cat << 'EOF' > ~/start_jupyter.sh
#!/bin/bash
# تشغيل Jupyter Notebook على المنفذ 8888 بدون فتح المتصفح تلقائياً
jupyter notebook --no-browser --ip=0.0.0.0 --port=8888
EOF
chmod +x ~/start_jupyter.sh

echo ""
echo "-----------------------------------------"
echo "تحسين تجربة كالي..."
echo "-----------------------------------------"

echo "تثبيت محررات النصوص Neovim و micro، بالإضافة إلى git و GitHub CLI..."
$PKG_INSTALL neovim micro git gh

# إضافة بعض الاختصارات في ملف bashrc لتسهيل الاستخدام
{
    echo "alias ll='ls -la'"
    echo "alias gs='git status'"
} >> ~/.bashrc

# تثبيت VNC Server (استخدام TigerVNC كمثال)
echo "تثبيت TigerVNC..."
$PKG_INSTALL tigervnc-standalone-server

# إعداد ملف xstartup الخاص بـ VNC لتشغيل XFCE4
mkdir -p ~/.vnc
cat << 'EOF' > ~/.vnc/xstartup
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF
chmod +x ~/.vnc/xstartup

echo ""
echo "-----------------------------------------"
echo "توفير بيئة سطح مكتب خفيفة ومستقرة..."
echo "-----------------------------------------"

echo "تثبيت XFCE4 و Firefox ESR..."
$PKG_INSTALL xfce4 firefox-esr

# إعداد RVNC ليعمل عند بدء التشغيل (مثال بسيط)
echo "rvnc start" >> ~/.bashrc

echo ""
echo "-----------------------------------------"
echo "تحضير المستودع للتثبيت السلس..."
echo "-----------------------------------------"

# إنشاء README.md في حالة عدم وجوده
if [ ! -f README.md ]; then
    cat << 'EOF' > README.md
# إعداد بيئة كالي نظيفة للتطوير

يهدف هذا المشروع إلى توفير بيئة كالي خالية من أدوات الاختراق ومجهزة بأدوات تطوير حديثة تشمل:
- تطوير تطبيقات الأندرويد.
- دعم الذكاء الاصطناعي.
- بيئة سطح مكتب XFCE4 خفيفة ومستقرة.
- تحسين تجربة الاستخدام عبر إعداد VNC.

## طريقة التثبيت

لتثبيت جميع الأدوات والإعدادات، قم بتشغيل السكربت:
\`\`\`
sudo bash setup.sh
\`\`\`

## ملاحظات
- تأكد من تشغيل السكربت بصلاحيات الجذر.
- راجع دليل README للمزيد من التفاصيل.
- هذا المشروع مفتوح المصدر ومخصص للتطوير والتعليم فقط.
EOF
fi

# إنشاء LICENSE.md في حالة عدم وجوده
if [ ! -f LICENSE.md ]; then
    cat << 'EOF' > LICENSE.md
MIT License

حقوق النشر (c) [سنة الإصدار] [اسم المالك]

يُمنح بموجب هذا الترخيص أي شخص الحصول على نسخة من هذا البرنامج واستخدامه والتعديل عليه دون قيود،
مع ضرورة ذكر الحقوق الأصلية. 

هذا البرنامج مفتوح المصدر ومخصص لأغراض التطوير والتعليم فقط.
EOF
fi

echo ""
echo "-----------------------------------------"
echo "إعداد كالي النظيف اكتمل بنجاح!"
echo "يرجى مراجعة README.md لمزيد من التفاصيل."
