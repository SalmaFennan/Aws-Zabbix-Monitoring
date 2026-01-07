#!/bin/bash

echo "=========================================="
echo "Installation Docker et Docker-Compose"
echo "=========================================="

echo "[1/7] Mise à jour du système..."
sudo apt update -y && sudo apt upgrade -y

echo "[2/7] Installation des dépendances..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release

echo "[3/7] Ajout du dépôt Docker..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "[4/7] Installation de Docker..."
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "[5/7] Démarrage de Docker..."
sudo systemctl start docker
sudo systemctl enable docker

echo "[6/7] Configuration des permissions..."
sudo usermod -aG docker $USER

echo "[7/7] Vérification..."
sudo docker --version
sudo docker compose version

echo ""
echo "=========================================="
echo " Installation terminée !"
echo "=========================================="
echo "  Déconnectez-vous et reconnectez-vous"