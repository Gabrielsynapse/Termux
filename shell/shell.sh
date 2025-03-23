#!/data/data/com.termux/files/usr/bin/bash

# use: shell [option] [source]
opt=$1;
src=$2;
filename_out="${2%.*}";
version="v2.2.1"

function install(){
	filetemp=$1.temp;
	echo "#!"$BASH >> $filetemp
	arq=""
	mapfile -t array < <(tail -n +2 "$src")
	for linha in "${array[@]}"; do
		arq+="$linha
"
	done
	echo "$arq" >> $filetemp
	cat $filetemp
	echo "...compilando '$src'"
	shc -f $filetemp -o $filename_out && rm "$src.temp.x.c" && rm $filetemp
	mv $filename_out ~/bin && chmod +x "$HOME/bin/$filename_out"
	echo "script $src instalado com exito!"
}
function ms_version(){
	echo "shell version: $version"
}
function ms_usage(){
	echo "usage: shell [option] [source]"
}
function ms_helper(){
	echo "===================helper==================="
	ms_version
	echo "shell --help"
	echo "usage: shell [option] [source]"
	echo "options"
	echo "	install"
	echo "		instala pacotes passados por argumentos"
	echo "		shell install [file.sh]"
	echo ""
	echo "	uninstall"
	echo "		desinstala pacote instalado passado por argumento"
	echo "		shell uninstall [comand]"
	echo ""
	echo "	--help"
	echo "		instrucoes de ajuda para o comando shell"
	echo "	--version"
	echo "		mostra a versao do comando"
}
#se option for install
if [ "$opt" == "install" ]; then
	#entao precisa de um source
	if [ "$src" != "" ]; then
		install $src
	else
		ms_usage
	fi
#se option for uninstall
elif [ "$opt" == "uninstall" ]; then
	#entao precisa de um source
	if [ "$src" != "" ]; then
		echo "...desinstalando '$src'"
		rm "$HOME/bin/$src" && echo "script $src desinstalado com exito!"
	else
		ms_usage
	fi
elif [ "$opt" == "--help" ]; then
	ms_helper
elif [ "$opt" == "--version" ]; then
	ms_version
else
	ms_usage
fi