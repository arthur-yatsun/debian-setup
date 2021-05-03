#!/usr/bin/env bash
set -e

source ./utils.bash
echo -e "\ninstall databases"

: '
- MySQL
- PostgreSQL
- MongoDB
'

# install mysql
check mysql || \
(
  echo -e "\ninstall mysql" && \
  sudo apt install mysql-server && \
  echo "mysql was installed"
)
# to check mysql server status run - `systemctl status mysql.service`
# for advanced configs go here https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04


# install postgres
check psql || \
(
  echo -e "\ninstall postgresql" && \
  sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - && \
  sudo apt-get update && \
  sudo apt-get install postgresql -y && \
  echo "postgresql was installed"
)
# to check postgresql server status run - systemctl status postgresql.service
# for advanced configs go here https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04


# install mongodb
check mongo || \
(
  echo -e "\ninstall mongodb" && \
  wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add - && \
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
  sudo apt update && \
  sudo apt install mongodb-org -y && \
  echo "mongodb was installed"
)
# to run mongo locally u have to start mongo daemon - `sudo systemctl start mongod`
# to run mongo locally run - `mongo`
# to stop mongo daemon process run -`sudo systemctl stop mongod`

# to check postgresql server status run - `systemctl status mongod.service`
# for advanced configs go here https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/