#!/bin/bash

# Déterminer l'adresse IP locale
IP=$(ipconfig getifaddr en0 2>/dev/null || hostname -I | awk '{print $1}')
TEMP_DIR=$(mktemp -d)

if [ -z "$IP" ]; then
  echo "Impossible de déterminer l'adresse IP locale."
  exit 1
fi

# Demander à l'utilisateur de choisir entre un fichier et un lien
choose=$(gum choose "File" "Link")

if [ "$choose" = "File" ]; then
  # Demander à l'utilisateur de fournir le nom du fichier
  read -p "Entrez le chemin du fichier à partager : " FILE

  # Vérifier si le fichier existe
  if [ ! -f "$FILE" ]; then
    echo "Erreur : fichier introuvable."
    exit 1
  fi

  # Copier le fichier dans le dossier temporaire
  cp "$FILE" "$TEMP_DIR"

  # Démarrer un serveur HTTP sur le port 8000
  cd "$TEMP_DIR" || exit
  python3 -m http.server 8000 >/dev/null 2>&1 &

  # URL du fichier
  URL="http://$IP:8000/$(basename "$FILE")"

elif [ "$choose" = "Link" ]; then
  # Demander à l'utilisateur de fournir un lien
  read -p "Entrez le lien à partager : " URL

  # Vérifier si le lien est valide (simple vérification de format)
  if [[ ! "$URL" =~ ^http(s)?:// ]]; then
    echo "Erreur : lien invalide."
    exit 1
  fi

else
  echo "Option invalide"
  exit 1
fi

clear

# Afficher le QR Code dans le terminal
echo "Scannez ce QR Code avec votre téléphone ou cliquer sur ce lien pour accéder au fichier ou au lien :"
qrencode -t ANSIUTF8 "$URL"
echo $URL

# Attendre que l'utilisateur ferme le serveur
echo "Appuyez sur Entrée pour arrêter le serveur..."
read -r
kill $(lsof -ti :8000)
clear
clear
rm -r "$TEMP_DIR"
