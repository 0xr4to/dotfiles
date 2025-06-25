#!/usr/bin/env bash

# Arte ASCII (pinguim do Arch Linux 🐧)
cat << "EOF"

                 .88888888:.
                88888888.88888.
              .8888888888888888.
              888888888888888888
              88' _`88'_  `88888
              88 88 88 88  88888
              88_88_::_88_:88888
              88:::,::,:::::8888
              88`:::::::::'`8888
             .88  `::::'    8:88.
            8888            `8:888.
          .8888'             `888888.
         .8888:..  .::.  ...:'8888888:.
        .8888.'     :'     `'::`88:88888
       .8888        '         `.888:8888.
      888:8         .           888:88888
    .888:88        .:           888:88888:
    8888888.       ::           88:888888
    `.::.888.      ::          .88888888
   .::::::.888.    ::         :::`8888'.:.
  ::::::::::.888   '         .::::::::::::
  ::::::::::::.8    '      .:8::::::::::::.
 .::::::::::::::.        .:888:::::::::::::
 :::::::::::::::88:.__..:88888:::::::::::'
  `'.:::::::::::88888888888.88:::::::::'

   Arch Linux Update Assistant 🐧
EOF

# Mostra a lista de pacotes que têm atualização disponível
#echo -e "\nList of softwares to be updated:\n"
#checkupdates

# Pergunta ao usuário se ele deseja atualizar
read -rp $'\nWould you like to update the system? [Y/n]: ' response

# Trata a resposta do usuário (vazio ou 'y' ou 'Y' continua)
if [[ -z "$response" || "$response" =~ ^[Yy]$ ]]; then
    echo -e "\nUpdating the system..."
    sudo pacman -Syu --noconfirm && {
        echo -e "\nSystem updated successfully. Rebooting..."
        reboot
    }
else
    echo -e "\nUpdate canceled. Bye >:)"
    sleep 1
    exit 0
fi

