#!/bin/bash
#recebendo valores variaveis

tamgrupo=`wc --lines  < /home/renan/curso/groups.txt`
tamanho=`wc --lines  < /home/renan/curso/users.txt`
tamdir=`wc --lines  < /home/renan/curso/diretorios.txt`

#criando grupos

echo "criando grupos"
for counterg in  $(seq 1 $(($tamgrupo+1)))
do
linhag=`cat /home/renan/curso/groups.txt | head -$counterg | tail -1`
echo "grupo adicionado: $linhag"
#groupadd -g 999$counterg $linhag
done

#criando diretorios

echo "criando diretorios"
for counterd in  $(seq 1 $(($tamdir+1)))
do
linhad=`cat /home/renan/curso/diretorios.txt | head -$counterd | tail -1`
echo "diretorio criado: $linhad"
#`mkdir $linhad`
done

#dando permissao em diretorios grupos

echo "permissoes especificas."
chmod 777 /publica
chown root:GRP_ADM /adm
chmod 770 /adm
chown root:GRP_VEN /ven
chmod 770 /adm
chown root:GRP_SEC /sec
chmod 770 /adm

#criando usuario e adicionando em grupos

for counter in  $(seq 1 $(($tamanho-5)))
do
linha=`cat /home/renan/curso/users.txt | head -$counter | tail -1`
echo "usuarios administradores: $linha"
#useradd $linha -m -s /bin/bash -p $(openssl passwd $linha123@mudar) -G GRP_ADM
done

for counter in  $(seq 4 $(($tamanho-2)))
do
linha=`cat /home/renan/curso/users.txt | head -$counter | tail -1`
echo "usuarios vendedores: $linha"
#useradd $linha -m -s /bin/bash -p $(openssl passwd $linha123@mudar) -G GRP_VEN
done

for counter in  $(seq 6 $(($tamanho)))
do
linha=`cat /home/renan/curso/users.txt | head -$counter | tail -1`
echo "usuarios secretariados: $linha"
#useradd $linha -m -s /bin/bash -p $(openssl passwd $linha123@mudar) -G GRP_SEC
done