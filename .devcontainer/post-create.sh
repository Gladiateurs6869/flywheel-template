#!/usr/bin/env bash
# Exécuté UNE seule fois, à la création du Codespace.
set -e

echo "==> Installation des bibliothèques graphiques pour la fenêtre du simulateur"
sudo apt-get update -qq
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
  libgl1 libglx-mesa0 libgl1-mesa-dri \
  libx11-6 libxext6 libxrandr2 libxinerama1 libxcursor1 libxi6

chmod +x gradlew

echo "==> Téléchargement de WPILib et REVLib (2 à 5 minutes la première fois)..."
./gradlew build -x test --console=plain || echo "La compilation a échoué : c'est normal si le code n'est pas terminé."

echo ""
echo "=========================================="
echo "  Ton Codespace est prêt ! Bonne séance :)"
echo "=========================================="
