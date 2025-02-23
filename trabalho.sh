#!/bin/bash

LOG_FILE="/home/ec2-user/logs.txt"

echo "Iniciando instalação..." > $LOG_FILE

sudo yum install -y httpd && echo "Apache instalado" >> $LOG_FILE

sudo yum install -y git && echo "Git instalado" >> $LOG_FILE

git clone https://github.com/mdn/beginner-html-site-styled && echo "Clone do repositório concluído" >> $LOG_FILE

sudo mv -f beginner-html-site-styled/* /var/www/html/ && echo "Arquivos movidos para a pasta do Apache" >> $LOG_FILE

sudo systemctl enable httpd && echo "Apache ativado para iniciar com o sistema" >> $LOG_FILE
sudo systemctl start httpd && echo "Apache iniciado" >> $LOG_FILE

curl -X POST -d "nome=João Victor de Almeida" https://difusaotech.com.br/lab/aws/index.php

echo "Instalação concluída!" >> $LOG_FILE
