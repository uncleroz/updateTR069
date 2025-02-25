#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
local_ip=$(hostname -I | awk '{print $1}')

#Sukses
	echo -e "${GREEN}<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>"
	echo -e "${GREEN}==============================================="
	echo -e "${GREEN}           Update Parameter GenieACS           "
	echo -e "${GREEN}      Apakah anda ingin melanjutkan? (y/n)${NC}"
	echo -e "${GREEN}==============================================="
	echo -e "${GREEN}<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>"
	read confirmation

if [ "$confirmation" != "y" ]; then
	echo -e "${RED}<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>"
	echo -e "${RED}==============================================="
    echo -e "${RED}           Install dibatalkan..           ${NC}"
	echo -e "${RED}==============================================="
	echo -e "${RED}<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>"
    exit 1
fi
for ((i = 5; i >= 1; i--)); do
	sleep 1
    echo "Nungguin ya. Sabar dong"
done

	sudo apt install unzip
	rm -r /usr/lib/node_modules/genieacs
	unzip genieacs.zip -d /usr/lib/node_modules/

	sudo mongodump --db=genieacs --out genieacs-backup-new
	sudo mongorestore --db=genieacs --drop virtualparameter

#Sukses
	echo -e "${GREEN}<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>"
	echo -e "${GREEN}====================================================="
	echo -e "${GREEN}       Akses GenieACS : http://$local_ip:3000   ${NC}"
	echo -e "${GREEN}====================================================="
	echo -e "${GREEN}<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>"