#!/bin/bash

if [[ $EUID -eq 0 ]]; then
  echo "Running as root."
  FONTDIR="/usr/share/fonts"
else
  echo "Running as user."
  FONTDIR="$HOME/.fonts"
fi

echo "Which font set do you want to install?"
echo "1. Adobe (Source Code Pro, Source Sans 3, Source Serif 3);"
echo "2. Palo Alto (JetBrains Mono, Inter, Roboto Slab);"
echo "3. Redmond (Cascadia Code, Clear Sans, CMU Serif);"
echo "0. Exit."
echo
read -p "> " choice

if [[ ! "$choice" =~ ^[0-3]$ ]]; then
  echo "Invalid choice. Exiting."
  exit 1
fi

case $numero in
  0)
    exit 0
    ;;
  1)
    if [[ -d "adobe" ]]; then
      echo "Installing the Adobe font set in $FONTDIR..."
      cp -r adobe/* "$FONTDIR"
      echo "Done."
    else
      echo "The Adobe font set can't be installed, missing directory."
    fi
    ;;
  2)
    if [[ -d "paloalto" ]]; then
      echo "Installing the Palo Alto font set in $FONTDIR..."
      cp -r paloalto/* "$FONTDIR"
      echo "Done."
    else
      echo "The Palo Alto font set can't be installed, missing directory."
    fi
    ;;
    ;;
  3)
    if [[ -d "redmond" ]]; then
      echo "Installing the Redmond font set in $FONTDIR..."
      cp -r redmond/* "$FONTDIR"
      echo "Done."
    else
      echo "The Redmond font set can't be installed, missing directory."
    fi
    ;;
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac