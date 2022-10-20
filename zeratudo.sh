#!/bin/bash
#recebendo valores variaveis

tamgrupo=`wc --lines  < /home/renan/curso/groups.txt`
tamanho=`wc --lines  < /home/renan/curso/users.txt`
tamdir=`wc --lines  < /home/renan/curso/diretorios.txt`

#criando grupos

echo "removendo grupos"
for counterg in  $(seq 1 $(($tamgrupo+1)))
do
linhag=`cat /home/renan/curso/groups.txt | head -$counterg | tail -1`
echo "grupo removido: $linhag"
groupdel $linhag
done

#criando diretorios

echo "removendo diretorios"
for counterd in  $(seq 1 $(($tamdir+1)))
do
linhad=`cat /home/renan/curso/diretorios.txt | head -$counterd | tail -1`
echo "diretorio removido: $linhad"
`rmdir $linhad`
done


#criando usuario e adicionando em grupos

for counter in  $(seq 1 $tamanho)
do
linha=`cat /home/renan/curso/users.txt | head -$counter | tail -1`
echo "removendo usuarios: $linha"
userdel -r $linha
done
