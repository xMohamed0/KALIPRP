#!/bin/bash
#by Mohamed Alzhrani
ESC=$(printf '\033') RESET="${ESC}[0m" BLACK="${ESC}[30m" RED="${ESC}[31m"
GREEN="${ESC}[32m" YELLOW="${ESC}[33m" BLUE="${ESC}[34m" MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m" WHITE="${ESC}[37m" DEFAULT="${ESC}[39m"
greenprint() { printf "${GREEN}%s${RESET}\n" "$1"; }
blueprint() { printf "${BLUE}%s${RESET}\n" "$1"; }
redprint() { printf "${RED}%s${RESET}\n" "$1"; }
yellowprint() { printf "${YELLOW}%s${RESET}\n" "$1"; }
magentaprint() { printf "${MAGENTA}%s${RESET}\n" "$1"; }
cyanprint() { printf "${CYAN}%s${RESET}\n" "$1"; }


if [ "$BASH_SOURCE" = "" ]; then
    /bin/bash "$0"
    exit 0
fi

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

. "func2.sh"


Install_atom() {

    echo -ne "
    $(yellowprint 'Installing Atom')"
    echo
    echo
    apt update >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "]"
    echo
    apt -y install wget gpg >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "]"
    echo
    sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list' >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "]"
    echo
    wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add - >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "]"
    echo
    apt update >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "]"
    echo
    apt install -y atom >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "] done!"
    echo

    echo -ne "
    $(yellowprint 'Install Done')
    $(redprint 'Press enter to continue ... ')"
    read response

    return 1
}

MsfDown() {

    echo -ne "
    $(yellowprint 'Downgrade Metasploit')"
    echo
    echo
    eval apt -y remove metasploit-framework >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "]"
    echo
    wget https://archive.kali.org/kali/pool/main/m/metasploit-framework/metasploit-framework_5.0.101-0kali1%2Bb1_amd64.deb -O /tmp/metasploit-framework_5.deb >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "]"
    echo
    eval dpkg -i /tmp/metasploit-framework_5.deb >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "]"
    echo
    eval gem cleanup reline >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "]"
    echo
    eval msfdb init >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "]"
    echo
    rm -f /tmp/metasploit-framework_5.deb >/dev/null 2>&1
    apt-mark hold metasploit-framework >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "] done!"
    echo
    echo -ne "
    $(yellowprint 'Downgrade Metasploit Done')
    $(redprint 'Press enter to continue ... ')"
    read response

    return 1
}

Install_chrome() {
  if [[ -n $(find / -name google-chrome) ]]; then
    echo -ne "$(cyanprint '[+]Chrome already installed - skipping')"
    echo
  else
    echo -ne "$(greenprint '[+]Installing chrome')"
    echo
  eval wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb >/dev/null 2>&1 & PID=$!
  printf "["
  while kill -0 $PID 2> /dev/null; do
  printf  "▓"
  sleep 5
  done
  printf "]"
  echo
  eval dpkg -i /tmp/google-chrome-stable_current_amd64.deb >/dev/null 2>&1 & PID=$!
  printf "["
  while kill -0 $PID 2> /dev/null; do
  printf  "▓"
  sleep 5
  done
  printf "]"
  echo
  rm -f /tmp/google-chrome-stable_current_amd64.deb 2>&1 & PID=$!
  printf "["
  while kill -0 $PID 2> /dev/null; do
  printf  "▓"
  sleep 5
  done
  printf "]"
  echo
  echo -ne "$(blueprint '[*]Install Chrome Done')"
  echo
  fi
    echo -ne "
    $(yellowprint 'Install Done')
    $(redprint 'Press enter to continue ... ')"
    read response

    return 1
}

Fix_vm() {
  checkervm=$(virt-what | grep -i -c "vmware")
  if [ $checkervm = 1 ]
  then
    echo -ne "$(blueprint '[*]your kali installed on VmWare')"
    echo
    echo -ne "$(cyanprint '[+]Repaire your kali')"
    echo
    eval apt -y reinstall open-vm-tools-desktop fuse 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "]"
    echo
    echo -ne "$(cyanprint '[+]Restart VM Service')"
    echo
    eval restart-vm-tools
    2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "] done!"
    echo
    echo
  else
    echo -ne "$(redprint 'This tool only work on vmware. your kali not installed on VmWare')"
    echo
    echo
  fi
    echo -ne "
    $(yellowprint 'Fix Done')
    $(redprint 'Press enter to continue ... ')"
    read response

    return 1
}


PtMenu() {
    bash func1.sh


}

exit() {
    return 0
}


menuItems=(
    "1. Install Atom"
    "2. Install Pentest tools"
    "3. Fix Kali Virtual Machine"
    "4. Install Google Chrome"
    "5. Downgrade Metasploit"
    "Q. Exit  "
)

menuActions=(
    Install_atom
    PtMenu
    Fix_vm
    Install_chrome
    MsfDown
    exit
)

menuTitle=" KALIPRP TOOL"
menuFooter=" Enter=Select, Navigate via Up/Down/number/letter"
menuWidth=50
menuLeft=10
menuHighlight=$DRAW_COL_YELLOW

menuInit
menuLoop


exit 0
