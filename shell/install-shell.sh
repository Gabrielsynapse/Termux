#!/data/data/com.termux/files/home/bin/bash

bin="/data/data/com.termux/files/usr/bin"

echo "...instalando comando shell para termux"

#instala o comando shell no termux

echo "[info] escrevendo arquivos temporario"

echo "#!"$BASH > "shell.sh.temp"

mapfile -t array < <(tail -n +2 "shell.sh")
for linha in "${array[@]}"; do
	echo $linha >> "shell.sh.temp"
done

echo "[info] compilando e excluindo arquivos desnescessario"

shc -f "shell.sh.temp" -o "shell" && rm "shell.sh."*

echo "[info] movendo para $bin"

mv "shell" "$bin"

echo "[info] dando permisao para arquivo ~/bin/shell"

chmod +x "$bin/shell"

echo "instalado com suscesso"

shell a