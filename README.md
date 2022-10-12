# Imagem-docker-robot-framework


## Criação de imagem linux para execução de automação com robot framework


##  Imagem contem: 
```

timezone America/Sao_Paulo
pip3 install --upgrade pip
chrome
chromedriver


Na inicialização da mesma é executado o comando pip3 install -r "requirements.txt", então na pasta do seu projeto devera conter o arquivo requirements.txt com todas suas dependências..

```
```
## Uso

Criar conta no: https://hub.docker.com/signup

Instalar o docker na máquina Instalar o Docker

Efetuar o clone desse projeto

Na pasta local desse projeto, efetuar o build do projeto para publicação da imagem em sua conta...
Execute o seguinte comando:
docker build -t "username/nomeimagemasercriada" .\pastaondeestaesseodockerfile\

Efetuar a publicação de sua imagem:
Execute o seguinte comando:
docker push username/nomeimagemasercriada

Caso solicite o login..
Digite docker login
Seu username
Sua senha
E novamente o comando docker push username/nomeimagemasercriada

Apos esses processos forem efetuados sua imagem estará publicada em sua conta no https://hub.docker.com/signup


Comando para execução de sua automação local iniciando essa maquina linux publicada:

### docker run -v C:\caminhocompletodaautomação:/data username/nomeimagemcriada comando robot de execução da automação.
```