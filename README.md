## Guia em Português
## English guide is after the portuguese guide


## meukeypair.pem é a chave de acesso criada 
## Para acessar a instância EC2 publica criada, lembrando que você deve alterar o ip para o acesso da maquina, você acessa pelo comando
ssh -i ~/.ssh/meukeypair.pem ubuntu@IP_DA_MAQUINA_PUBLICA

## Dentro da maquina  EC2, são feitos os comandos abaixo para instalação do docker e roda-lo com o RDS
sudo apt-get update && sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+t /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install --yes docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

##LEMBRAR DE ALTERAR O MONGODB_HOST PARA O DNS_DO_RDS
sudo docker container run -dp 80:8080 -e MONGODB_HOST=DNS_DO_RDS -e MONGODB_USERNAME=mongouser -e MONGODB_PASSWORD=mongopwd harrisonlima/kube-news:v1
## Para verificar se a imagem está rodando naturalmente
sudo docker container ls
## Após a verificação do container estar rodando normalmente, você irá sair do acesso a máquina privada e irá retornar à maquina pública, com o comando:
exit
## Com tudo rodando normalmente, você irá acessar a aplicação pelo browser, utilizando o ip da máquina pública












## English guide
## meukeypair.pem is the created access key
## To access the created public EC2 instance, you access using the command, reminding that you must change the PUBLIC_MACHINE_IP to access: 
ssh -i ~/.ssh/meukeypair.pem ubuntu@PUBLIC_MACHINE_IP

## Inside the EC2 machine, you will install docker and run the image of the application connected to the RDS database
sudo apt-get update && sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+t /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install --yes docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

## Reminding of changing the MONGODB_HOST TO DNS_OF_RDS
sudo docker container run -dp 80:8080 -e MONGODB_HOST=DNS_OF_RDS -e MONGODB_USERNAME=mongouser -e MONGODB_PASSWORD=mongopwd harrisonlima/kube-news:v1
## To verify if the image is running properly
sudo docker container ls
## After verifying if the container is running properly, you will leave the private machine and return to the public machine:
exit
## With everything running properly, you will have access to the application by browser using the public ip of the machine.
# AWS-RDS-EC2
