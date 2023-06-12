#!/bin/bash

# GNU License | Fatih ÖNDER - https://fatihonder.org.tr/


RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

read -p "Aranacak dosya adını girin: " filename

echo -e "Dosya aranıyor..."

# Tüm sistemi ara
search_result=$(sudo find / -name "$filename" 2>/dev/null)

if [[ -z "$search_result" ]]; then
    echo -e "${RED}Dosya bulunamadı! :-(${NC}"
else
    echo -e "${GREEN}Dosya bulundu. :-)${NC}"
    echo -e ${GREEN}"Dosya yolu:" "${search_result}${NC}"
    
    read -p "Dosya yolunu açmak için Enter tuşuna basın..."
    
    # Nautilus dosya yöneticisi ile dosya yolunu aç
    nautilus "$search_result"
fi

