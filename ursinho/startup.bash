# Script usado para instalar o docker e adicionar o usuário informado na chave SSH no grupo Docker
sudo apt update
sudo apt install --yes apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install --yes docker-ce
sudo deluser --remove-home tiago_alexandre
sudo deluser --remove-home weder
sudo deluser --remove-home groove
sudo deluser --remove-home tasal
sudo deluser --remove-home cloyoll
DOCKER_USER=$(tail -n 1 /etc/passwd | cut -d: -f 1);
sudo usermod -aG docker $DOCKER_USER
unset $DOCKER_USER