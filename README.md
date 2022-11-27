# BACKUP MYSQL OU MARIADB
- Faça beckup do seu banco de dados localmente usando um script simples e funcional, evite perca de dados...

Para baixar o script basta usar o comando:

```bash
wget https://raw.githubusercontent.com/PA1NK1LL3R-777/backup-mysql-mariadb/main/backup-mysql.sh
```

# Edite o arquivo para que faça Backup do seu banco de dados.

Abra o arquivo em um editor, por exemplo vi/nano/vim.

Use:

```bash
vi backup-mysql.sh
```
Ou

```bash
vim backup-mysql.sh
```
Ou

```bash
nano backup-mysql.sh
```

Isso irar abrir o arquivo e você deverá editar essas linhas:

```bash
# USUARIO DO BANCO DE DADOS
USER_DB='root'
# SENHA DO BANCO DE DADOS
SENHA_DB='passw@rd'
# NOME DO BANCO DE DADOS
NOME_BANCO='wps'
# DATA DO BACKUP
DATABKP=`date +%Y-%d-%m-%H_%M_%S`
# APAGAR O BACKUP EM X DIAS
DIAS_PARA_GUARDAR=5    # Mude o 5 Para 0 para ficar com backup para sempre.
# DIRETORIO AONDE VAI FICAR O BACKUP
DIR_BKP='/root/bkpdb'
# FAZER COMPRESSAO DO BANCO DE DADOS?
GZIP=0            # 1 = Mude o 0 para 1 caso queira comprimir o banco de dados em GZIP
```

# Dê permissão de execução para o script

```bash
chmod +x backup-mysql.sh
```

# Mova o arquivo para algum diretório espefico.

Exemplo:

```bash
mv -v backup-mysql.sh /usr/local/sbin/
``` 

# Adicione no crontab

Entre em modo root, caso não já esteja.

```bash
sudo su -
```

Agora adcione a linha no crontab

```bash
crontab -e
```

Você vai escolher a quantidade de vezes que o backup será feito, exemplo:

```bash
00 14 * * * /usr/local/sbin/backup-mysql.sh
```

Nesse exemplo, o backup será feito uma vez por dia, as 2:00/14:00 PM.

Aconselho que pesquise como usar o crontab, assim você saberá como configurar da melhor forma que vá lhe atender.
