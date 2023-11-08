#!/bin/bash
    
    echo '========================================================'
    echo '=== PASO 1: INSTALACIÓN DE PREREQUISITOS PARA DOCKER ==='
    echo '========================================================'
    sudo apt-get update
    sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    unzip \
    gnupg-agent \
    software-properties-common -y
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    
    echo '=============================================================='
    echo '=== PASO 2: AGREGAR REPOSITORIO PARA LA INSTALACIÓN DOCKER ==='
    echo '=============================================================='
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    sudo apt-get update
    
    echo '====================================='
    echo '=== PASO 3: INSTALACIÓN DE DOCKER ==='
    echo '====================================='
    sudo apt-get install docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    # Iniciar Docker junto con el Arranque del Sistema Operativo
    sudo systemctl enable docker
    # Agregar Usuario Actual al Grupo de Docker
    sudo usermod -aG docker ubuntu
    
    echo '============================================='
    echo '=== PASO 4: INSTALACIÓN DE DOCKER-COMPOSE ==='
    echo '============================================='
    sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    
    echo '==============================================================='
    echo '=== PASO 5: INICIAR DOCKER AL ARRANCAR EL SISTEMA OPERATIVO ==='
    echo '==============================================================='
    sudo systemctl enable docker
    
    echo '========================================================='
    echo '=== PASO 6: AGREGAR USUARIO ACTUAL AL GRUPO DE DOCKER ==='
    echo '========================================================='
    sudo groupadd docker
    sudo usermod -aG docker ubuntu
    
    echo '========================================='
    echo '=== PASO 7: INSTALAR HERRAMIENTA CTOP ==='
    echo '========================================='
    sudo apt-get install ca-certificates curl gnupg lsb-release
    curl -fsSL https://azlux.fr/repo.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/azlux-archive-keyring.gpg
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian \
    $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azlux.list >/dev/null
    sudo apt-get update
    sudo apt-get install docker.io

