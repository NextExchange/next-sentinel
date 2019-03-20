#!/bin/bash
set -evx

mkdir ~/.next

# safety check
if [ ! -f ~/.next/nextcoin.conf ]; then
  cp share/nextcoin.conf.example ~/.next/nextcoin.conf
fi
