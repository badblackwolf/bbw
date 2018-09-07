#!/usr/bin/env bash

THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

install() {
	    cd tg
		sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
		sudo apt-get install g++-4.7 -y c++-4.7 -y
		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y
		sudo apt-get install screen -y
		sudo apt-get install tmux -y
		sudo apt-get install libstdc++6 -y
		sudo apt-get install lua-lgi -y
		sudo apt-get install libnotify-dev -y
		sudo service redis-server restart
		wget https://valtman.name/files/telegram-cli-1222
		mv telegram-cli-1222 tgcli
		chmod +x tgcli
		cd
		wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz
                tar zxpf luarocks-2.2.2.tar.gz
                cd luarocks-2.2.2
                ./configure; sudo make bootstrap
                sudo luarocks install luasocket
                sudo luarocks install luasec
                sudo luarocks install redis-lua
                 sudo luarocks install lua-term
                sudo luarocks install serpent
                sudo luarocks install dkjson
                sudo luarocks install lanes
                sudo luarocks install Lua-cURL
                sudo luarocks install luaxmlrpc
		cd
		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get install tmux
		sudo apt-get install luarocks
		sudo apt-get install screen
		sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev
		sudo apt-get update
		sudo apt-get install
		sudo apt-get install upstart-sysv
                sudo apt-get install libstdc++9
                sudo apt-get install libconfig++9v5 libstdc++6
                sudo apt-get install libstdc++6
                sudo apt-get install lua-lgi
                sudo apt-get install libnotify-dev
                sudo add-apt-repository ppa:ubuntu-toolchain-r/test 
                sudo apt-get update
                sudo apt-get upgrade
                sudo apt-get dist-upgrade
		cd bbw
		chmod +x bot
		chmod +x tg
		chmod +x autobbw.sh
}

function print_logo() {
	green "          ______   ______  ____      ____"
	green "         |_   _ \ |_   _ \|_  _|    |_  _|"
	green "           | |_) |  | |_) | \ \  /\  / /"
	green "           |  __'.  |  __'.  \ \/  \/ /"
	green "           | |__) |_| |__) |  \  /\  /"
	green "         |_______/|_______/    \/  \/"
	
	echo -e "\n\e[0m"
}

function logo_play() {
    declare -A txtlogo
    seconds="0.010"
    txtlogo[1]=" ______   ______  ____      ____"
    txtlogo[2]="|_   _ \ |_   _ \|_  _|    |_  _|"
    txtlogo[3]="  | |_) |  | |_) | \ \  /\  / /"
    txtlogo[4]="  |  __'.  |  __'.  \ \/  \/ /"
    txtlogo[5]=" _| |__) |_| |__) |  \  /\  /"
    txtlogo[6]="|_______/|_______/    \/  \/"
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

function beyondteam() {
	echo -e "\e[0m"
	green "     >>>>                       We Are Not Attacker                             "
	green "     >>>>                       We Are Not Alliance                             "
	white "     >>>>                       We Are Programmer                               "
	white "     >>>>                       We Are The Best                                 "
	red   "     >>>>                       We Are Family                                   "
	red   "     >>>>                       @BAD_BLACK_WOLF                                 "
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
	beyondteam
	logo_play
	install
  else
if [ ! -f ./tg/tgcli ]; then
    echo "tg not found"
    echo "Run $0 install"
    exit 1
 fi
	print_logo
	beyondteam
	logo_play
   #sudo service redis-server restart
   ./tg/tgcli -s ./bot/bot.lua -l 1 -E $@
   #./tg/tgcli -s ./bot/bot.lua $@
fi
