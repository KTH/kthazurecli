 # KTHAzurecli

Innehåller dockerfile för att skapa upp kthazurecli v1 med KTH beroenden

Detta är V1 versionen av cli:t för att kunna administrera från Mac/Lin/Windows utan att behöva installera alla komponenterna på sin dator.

## Prereqs
Man måste se till att installera Docker for Mac/Windows för att kunna köra docker på sin dator. 
Linux behöver ha docker installerat. 

Instruktioner för installation på

Windows [https://www.docker.com/docker-windows]

Mac [https://docs.docker.com/docker-for-mac/]

Ubuntu [https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/]

Centos [https://docs.docker.com/engine/installation/linux/docker-ce/centos/]

Fedora [https://docs.docker.com/engine/installation/linux/docker-ce/fedora/]


## Howto

#Skapar en folder som man kan montera och clona git repos
```
mkdir ~/git
```

Skapar folder som man kan montera och ha everest hemligheterna
```
mkdir ~/everest-secrets
```

Exekvera containern och montera lokala ssh nycklar i readwrite läge
```
docker run -it --rm -v ~/.ssh:/root/.ssh -v ~/git:/root/git -v ~/everest-secrets:/root/everest-secrets:ro kthse/kthazurecli:latest
```
