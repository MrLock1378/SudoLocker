#!/usr/bin/env bash

cd $HOME/SudoLocker

install() {
		sudo apt-get update
		sudo apt-get upgrade
sudo apt-get install lua5.1 luarocks lua-socket lua-sec redis-server curl 
sudo luarocks install oauth 
sudo luarocks install redis-lua 
sudo luarocks install lua-cjson 
sudo luarocks install ansicolors 
sudo luarocks install serpent 
}

function print_logo() {
	green "         @░L░o░c░k░e░r░T░e░a░m░     by     ░@░S░u░d░o░L░o░c░k░e░r░ "
	green "         @--L--O--C--K--E--R--T--E--A--M    By  @SudoLocker     "
	green "         @░L░o░c░k░e░r░T░e░a░m░     by     ░@░S░u░d░o░L░o░c░k░e░r░"
	green "         ̴Mr:Mohammadreza   @	SudoLocker"
	echo -e "\n\e[0m"
}

function logo_play() {
    declare -A txtlogo
    seconds="0.010"
    txtlogo[1]="  @░L░o░c░k░e░r░T░e░a░m░     by     ░@░S░u░d░o░L░o░c░k░e░r░ "
    txtlogo[2]="               @--L--O--C--K--E--R--T--E--A--M"
    txtlogo[3]="  @░L░o░c░k░e░r░T░e░a░m░     by     ░@░S░u░d░o░L░o░c░k░e░r░ "
    txtlogo[4]="               @--L--O--C--K--E--R--T--E--A--M"
    printf "\e[31m\t"
    for i in ${!txtlogo[@]}; do
        for x in `seq 0 ${#txtlogo[$i]}`; do
            printf "${txtlogo[$i]:$x:1}"
            sleep $seconds
        done
        printf "\n\t"
    done
    printf "\n"
	echo -e "\e[0m"
}

function Lockerteam() {
	echo -e "\e[0m"
	green "     ➠>>                       -----@░L░o░c░k░e░r░T░e░a░m░-----                                       "
	green "     ➠>>                       -----░R░E░B░O░R░N░T░E░A░M░-----                                        "
	white "     ➠>>                          --L--O--C--K--E--R--T-E--A-M--                                      "
	white "     ➠>>                       -----░@░S░u░d░o░L░o░c░k░e░r░-----                                      "
	red   "     ➠>>                       -----░@░B░o░t░R░e░b░o░r░n░_░C░H░-----                                  "
	red   "     ➠>>                       @LockerTeam    Byond-Locker                      "
	echo -e "\e[0m"
}

red() {
  printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}
green() {
  printf '\e[1;32m%s\n\e[0;39;49m' "$@"
}
white() {
  printf '\e[1;37m%s\n\e[0;39;49m' "$@"
}
update() {
	git pull
}

if [ "$1" = "install" ]; then
	print_logo
	Lockerteam
	logo_play
	install
elif [ "$1" = "update" ]; then
	logo_play
	Lockerteam
	update
	exit 1
else
	print_logo
	Lockerteam
	logo_play
	green "Lᴏᴄᴋᴇʀ Hᴇʟᴘᴇʀ Bᴏᴛ ʀᴜɴɴɪɴɢ..."
	#sudo service redis-server restart
	lua ./bot/bot.lua
fi
