#!/data/data/com.termux/files/home/bin/bash


bin="/data/data/com.termux/files/usr/bin"

function info(){
	echo "[info] $1"
}

if [ -f "$bin/shell" ]; then
	a=""
else
	echo "o comando nunca foi instalado"
	exit
fi

info "desinstalando comando shell"

info "excluindo arquivo em $bin/shell"
rm "$bin/shell"

#export JAVA_HOME=/data/data/com.termux/files/usr/share>
#export PATH="/data/data/com.termux/files/usr/bin/java/>