#!/bin/bash

LOG_FILE="/home/ec2-user/logs.txt"

echo "Iniciando instalação..." > $LOG_FILE

# Instalação do Apache
sudo yum install -y httpd && echo "Apache instalado" >> $LOG_FILE

# Instalação do Git
sudo yum install -y git && echo "Git instalado" >> $LOG_FILE

# Clonar repositório, verificando se já existe
if [ -d "beginner-html-site-styled" ]; then
    echo "Pasta do repositório já existe, removendo..." >> $LOG_FILE
    rm -rf beginner-html-site-styled
fi

git clone https://github.com/mdn/beginner-html-site-styled && echo "Clone do repositório concluído" >> $LOG_FILE

# Mover arquivos para o Apache
sudo mv -f beginner-html-site-styled/* /var/www/html/ && echo "Arquivos movidos para a pasta do Apache" >> $LOG_FILE

# Habilitar e iniciar o Apache
sudo systemctl enable httpd && echo "Apache ativado para iniciar com o sistema" >> $LOG_FILE
sudo systemctl start httpd && echo "Apache iniciado" >> $LOG_FILE

echo "Instalação concluída!" >> $LOG_FILE
