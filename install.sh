#!/bin/bash

if [[ $EUID -eq 0 ]]; then
  echo "Running as root."
  FONTDIR="/usr/share/fonts"
else
  echo "Running as user."
  FONTDIR="$HOME/.fonts"
fi

echo "Which font set do you want to install?"
echo "1. Odessa (JetBrains Mono, Inter, Roboto Slab);"
echo "2. Redmond (Cascadia Code, Clear Sans, CMU Serif);"
echo "3. San Francisco (SF Mono, SF Pro, New York);"
echo "4. San Jose (Source Code Pro, Source Sans 3, Source Serif 3);"
echo "0. Exit."
echo
read -p "> " choice

if [[ ! "$choice" =~ ^[0-4]$ ]]; then
  echo "Invalid choice. Exiting."
  exit 1
fi

if [[ "$choice" =~ ^[1-4]$  &&  ! $EUID -eq 0 && ! -d "$FONTDIR" ]]; then
  mkdir "$FONTDIR"
fi

case $choice in
  0)
    exit 0
    ;;
  1)
    if [[ -d "odessa" ]]; then
      echo "Installing the Odessa font set in $FONTDIR..."
      cp -r odessa/* "$FONTDIR"
      echo "Done."
    else
      echo "The Odessa font set can't be installed, missing directory."
    fi
    exit 0
    ;;
  2)
    if [[ -d "redmond" ]]; then
      echo "Installing the Redmond font set in $FONTDIR..."
      cp -r redmond/* "$FONTDIR"
      echo "Done."
    else
      echo "The Redmond font set can't be installed, missing directory."
    fi
    exit 0
    ;;
  3)
    if [[ -d "sanfrancisco" ]]; then
      echo "Installing the San Francisco font set in $FONTDIR..."
      cp -r sanfrancisco/* "$FONTDIR"
      echo "Done."
    else
      echo "The San Francisco font set can't be installed, missing directory."
    fi
    exit 0
    ;;
  4)
    if [[ -d "sanjose" ]]; then
      echo "Installing the San Jose font set in $FONTDIR..."
      cp -r sanjose/* "$FONTDIR"
      echo "Done."
    else
      echo "The San Jose font set can't be installed, missing directory."
    fi
    exit 0
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac