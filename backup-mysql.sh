#!/bin/bash
# --------------------------------------
# USUARIO DO BANCO DE DADOS
USER_DB='root'
# SENHA DO BANCO DE DADOS
SENHA_DB='Paink171@pain'
# NOME DO BANCO DE DADOS
NOME_BANCO='wps'
# DATA DO BACKUP
DATABKP=`date +%Y-%d-%m-%H_%M_%S`
# APAGAR O BACKUP EM X DIAS
DIAS_PARA_GUARDAR=5    # Mude o 5 Para 0 Para ficar com backup para sempre.
# DIRETORIO AONDE VAI FICAR O BACKUP
DIR_BKP='/root/bkpdb'
# FAZER COMPRESSAO DO BANCO DE DADOS?
GZIP=0            # Mude o 0 para 1 caso queira comprimir o banco de dados em GZIP

# --------------------------------------

# Criando a pasta do backup, caso nao esteja criada

if [ ! -d $DIR_BKP ]; then
  mkdir -p $DIR_BKP
fi

# SCRIPT

if [ "$GZIP" -eq 0 ] ; then
   echo "Fazendo backup do banco de dados: $NOME_BANCO sem compactação" 
   mysqldump -h 127.0.0.1 -u ${USER_DB} -p${SENHA_DB} -B ${NOME_BANCO} > ${DIR_BKP}/${NOME_BANCO}.${DATABKP}.sql 
else
   echo "Fazendo backup do banco de dados: $NOME_BANCO com compactação"
   mysqldump -h 127.0.0.1 -u ${USER_DB} -p${SENHA_DB} -B ${NOME_BANCO} | gzip -c > ${DIR_BKP}/${NOME_BANCO}.${DATABKP}.sql.gz
   fi

# Deletando o backup em X dias

if [ "$DIAS_PARA_GUARDAR" -gt 0 ] ; then
  echo "Excluindo backups anteriores a $DIAS_PARA_GUARDAR dias"
  find $DIR_BKP/* -mtime +$DIAS_PARA_GUARDAR -exec rm {} \;
fi
