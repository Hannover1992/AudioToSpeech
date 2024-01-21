#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

rm ./results.txt
rm -rf ./chunks/*
./split_mp3.sh $1
python3 ./text_to_speech.py
cat ./results.txt
