#!/bin/bash

sudo yum install -y httpd && echo "Apache instalado" > logs.txt

sudo yum install -y git-all && echo "Git instalado" >> logs.txt

git clone https://github.com/mdn/beginner-html-site-styled && echo "clone do repositório" >> logs.txt

sudo mv beginner-html-site-styled/* /var/www/html/ && echo "Arquivos na pasta do Apache" >> logs.txt

sudo systemctl enable httpd && echo "Apache ativo" >> logs.txt

sudo systemctl restart httpd && echo "Apache reiniciado" >> logs.txt
