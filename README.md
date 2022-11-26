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
USER='mysql-username'       # MySQL User
PASSWORD='mysql-password' # MySQL Password
DAYS_TO_KEEP=5    # 0 to keep forever
GZIP=0            # 1 = Compress
BACKUP_PATH='/home/backup/mysql'
```

Apenas troque o "user", "password" e o "backup_path".

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
