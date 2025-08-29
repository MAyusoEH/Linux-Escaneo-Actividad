#!/bin/bash

# COLOURS #---------------------------------------------------------------

cyanColour="\e[0;36m\033[1m"
cyanFColour="\e[5;36m\033[1m"
blueColour="\e[0;34m\033[1m"
blueFColour="\e[5;34m\033[1m"
purpleColour="\e[0;35m\033[1m"
purpleFColour="\e[5;35m\033[1m"
greenColour="\e[0;32m\033[1m"
greenFColour="\e[5;32m\033[1m"
yellowColour="\e[0;33m\033[1m"
yellowFColour="\e[5;33m\033[1m"
redColour="\e[0;31m\033[1m"
redFColour="\e[5;31m\033[1m"
grayColour="\e[0;37m\033[1m"
endColour="\033[0m\e[0m"

# CTRL+C = SALIR #-------------------------------------------------------

function ctrl_c(){
    tput civis
echo -e "${redColour}
#********************  CLOSING SCRIPT  **********************#
${endColour}"
    tput cnorm
    exit 1
}

trap ctrl_c INT

sleep 1
tput cnorm

# BANNER #----------------------------------------------------------------

tput civis
echo -e "${redColour}                               
#************************************************************#
#     -_    _-                                               #
#      º8--8º          REAL TIME PROCESS DETECTION           #
#    ----00----                                              #
#      _8--8_           by MAyuso Ethical Hacking            #
#     -      -                                               #
#************************************************************#

#******************** SCANNING ACTIVITY *********************#

${endColour}"

# script #---------------------------------------------------------------

old_process=$(ps -eo user,command)

while true; do
new_process=$(ps -eo user,command)
diff <(echo "$old_process") <(echo "$new_process") | grep "[\>\<]" | grep -vE "command|kworker|procmon|proc_det"
old_process=$new_process
done
