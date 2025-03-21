export TERM=xterm-256color
stty columns 80
cd /root
if [ ! -d /dev/net ]; then
  mkdir -pv /dev/net
  ln -sfv /dev/tun /dev/net/tun
fi

if [ ! -d /dev/fd ]; then
  ln -sfv /proc/self/fd /dev/fd
  ln -sfv /dev/fd/0 /dev/stdin
  ln -sfv /dev/fd/1 /dev/stdout
  ln -sfv /dev/fd/2 /dev/stderr
fi
. /root/.bashrc
. /root/.profile
cd ~
