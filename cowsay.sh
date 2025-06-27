#!/bin/bash
if ! command -v urban-cli &> /dev/null; then
	if command -v cowsay &> /dev/null; then
		fortune | cowsay -f tux
	fi
else
	if command -v cowsay &> /dev/null; then
		urban-cli -o random | cowsay -f tux
	fi
fi
