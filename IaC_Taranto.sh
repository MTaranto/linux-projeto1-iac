#!/bin/bash

echo "Removendo diretórios anteriores..."

sudo rm -Rf /publico/
sudo rm -Rf /adm/
sudo rm -Rf /ven/
sudo rm -Rf /sec/

echo "Removendo usuários antigos"

sudo userdel -r carlos
sudo userdel -r maria
sudo userdel -r joao
sudo userdel -r debora
sudo userdel -r sebastiana
sudo userdel -r roberto
sudo userdel -r josefina
sudo userdel -r amanda
sudo userdel -r rogerio
sudo userdel -r guest10
sudo userdel -r guest11
sudo userdel -r guest12
sudo userdel -r guest13

echo "Excluindo grupos..."

sudo groupdel GRP_ADM
sudo groupdel GRP_VEN
sudo groupdel GRP_SEC

echo "Criando diretórios..."

sudo mkdir /publico
sudo mkdir /adm
sudo mkdir /ven
sudo mkdir /sec

echo "Criando grupos de usuários..."

sudo groupadd GRP_ADM
sudo groupadd GRP_VEN
sudo groupadd GRP_SEC

echo "Criando usuários com pedido de nova senha..."

sudo useradd carlos -m -c "Carlos Eduardo" -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_ADM
sudo passwd carlos -e
sudo useradd maria -m -c "Maria da Penha" -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_ADM
sudo passwd maria -e
sudo useradd joao -m -c "João de Deus" -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_ADM
sudo passwd joao -e

sudo useradd debora -m -c "Débora Menezes" -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_VEN
sudo passwd debora -e
sudo useradd sebastiana -m -c "Sebastiana Cunha" -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_VEN
sudo passwd sebastiana -e
sudo useradd roberto -m -c "Roberto Pereira" -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_VEN
sudo passwd roberto -e

sudo useradd josefina -m -c "Josefina de Souza" -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_SEC
sudo passwd josefina -e
sudo useradd amanda -m -c "Amanda Vilella" -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_SEC
sudo passwd amanda -e
sudo useradd rogerio -m -c "Rogério Carvalho" -s /bin/bash -p $(openssl passwd -crypt 1234) -G GRP_SEC
sudo passwd rogerio -e

echo "Definindo permissões dos diretórios...."

sudo chown root:GRP_ADM /adm
sudo chown root:GRP_VEN /ven
sudo chown root:GRP_SEC /sec

sudo chmod 777 /publico
sudo chmod 770 /adm
sudo chmod 770 /ven
sudo chmod 770 /sec

echo "Processo finalizado!"