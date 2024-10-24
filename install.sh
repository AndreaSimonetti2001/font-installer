#!/bin/bash

if [[ $EUID -eq 0 ]]; then
  echo "Running as root."
  FONTDIR="/usr/share/fonts"
else
  echo "Running as user."
  FONTDIR="$HOME/.fonts"
fi

echo "Which font set do you want to install?"
echo
echo "N.  NAME          MONOSPACE        SANS           SERIF"
echo "1.  Independent   Cascadia Code    Clear Sans     Lora"
echo "2.  Apple         SF Mono          SF Pro         New York"
echo "3.  Adobe         Source Code Pro  Source Sans 3  Source Serif 4"
echo "4.  JetBrains     JetBrains Mono   Inter          Roboto Slab"
echo "5.  Microsoft     Aptos Mono       Aptos          Aptos Serif"
echo "0.  EXIT"
echo
read -p "> " choice

if [[ ! "$choice" =~ ^[0-5]$ ]]; then
  echo "Invalid choice. Exiting."
  exit 1
fi

if [[ "$choice" =~ ^[1-5]$  &&  ! $EUID -eq 0 && ! -d "$FONTDIR" ]]; then
  mkdir "$FONTDIR"
fi

case $choice in
  0)
    exit 0
    ;;
  1)
    if [[ -d "independent" ]]; then
      echo "Installing the Independent font set in $FONTDIR..."
      cp -r independent/* "$FONTDIR"
      echo "Done."
    else
      echo "The Independent font set can't be installed, missing directory."
    fi
    exit 0
    ;;
  2)
    if [[ -d "apple" ]]; then
      echo "Installing the Apple font set in $FONTDIR..."
      cp -r apple/* "$FONTDIR"
      echo "Done."
    else
      echo "The Apple font set can't be installed, missing directory."
    fi
    exit 0
    ;;
  3)
    if [[ -d "adobe" ]]; then
      echo "Installing the Adobe font set in $FONTDIR..."
      cp -r adobe/* "$FONTDIR"
      echo "Done."
    else
      echo "The Adobe font set can't be installed, missing directory."
    fi
    exit 0
    ;;
  4)
    if [[ -d "jetbrains" ]]; then
      echo "Installing the JetBrains font set in $FONTDIR..."
      cp -r jetbrains/* "$FONTDIR"
      echo "Done."
    else
      echo "The JetBrains font set can't be installed, missing directory."
    fi
    exit 0
    ;;
  5)
    if [[ -d "microsoft" ]]; then
      echo "Installing the Microsoft font set in $FONTDIR..."
      cp -r microsoft/* "$FONTDIR"
      echo "Done."
    else
      echo "The Microsoft font set can't be installed, missing directory."
    fi
    exit 0
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac