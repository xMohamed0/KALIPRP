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

web_vulnerability_tools() {
    # installing Nikto
    if [[ -n $(find / -name nikto) ]]; then
      echo -ne "$(cyanprint '[+]Nikto already installed - skipping')"
      echo
    else
      echo -ne "$(greenprint '[+]Installing Nikto')"
      echo
        apt -y install nikto >/dev/null 2>&1 & PID=$!
        printf "["
        while kill -0 $PID 2> /dev/null; do
        printf  "▓"
        sleep 5
        done
        printf "] done!"
        echo
        echo -ne "$(blueprint '[*]Install Nikto Done')"
        echo
    fi
    # installing ACSTIS
    if [[ -n $(find / -name acstis) ]]; then
        echo -ne "$(cyanprint '[+]ACSTIS already installed - skipping')"
        echo
    else
        echo -ne "$(greenprint '[+]Installing ACSTIS')"
        echo
        pip install https://github.com/tijme/angularjs-csti-scanner/archive/master.zip >/dev/null 2>&1 & PID=$!
        printf "["
        while kill -0 $PID 2> /dev/null; do
        printf  "▓"
        sleep 5
        done
        printf "] done!"
        echo
        echo -ne "$(blueprint '[*]Install ACSTIS Done')"
        echo
    fi
    # installing sqlmate
    if [[ -n $(find / -name sqlmate) ]]; then
       echo -ne "$(cyanprint '[+]sqlmate already installed - skipping')"
       echo
    else
       echo -ne "$(greenprint '[+]Installing sqlmate')"
       echo
       eval git clone https://github.com/UltimateHackers/sqlmate /opt/sqlmate >/dev/null 2>&1 && cd /opt/sqlmate >/dev/null 2>&1 && eval pip install -r requirements.txt >/dev/null 2>&1 & PID=$!
       printf "["
       while kill -0 $PID 2> /dev/null; do
       printf  "▓"
       sleep 5
       done
       printf "] done!"
       echo
       echo -ne "$(blueprint '[*]Install sqlmate Done')"
       echo
    fi
    echo -ne "
    $(yellowprint 'All Installs Done')
    $(redprint 'Press enter to continue ... ')"
    read response

   return 1
}

net_vulnerability_tools() {
    # install openVAS
    if [[ -n $(find / -name gvm-setup) ]]; then
      echo -ne "$(cyanprint '[+]openVAS already installed - skipping')"
      echo
    else
      echo -ne "$(greenprint '[+]Installing openVAS')"
      echo
        apt -y install openvas >/dev/null 2>&1 & PID=$!
        printf "["
        while kill -0 $PID 2> /dev/null; do
        printf  "▓"
        sleep 5
        done
        printf "] done!"
        echo
        echo -ne "$(blueprint '[*]Install openVAS Done')"
        echo
    fi
    # install celerytalk
    if [[ -n $(find / -name celerytalk) ]]; then
      echo -ne "$(cyanprint '[+]celerytalk already installed - skipping')"
      echo
    else
      echo -ne "$(greenprint '[+]Installing celerytalk')"
      echo
      eval git clone https://github.com/sethsec/celerystalk.git /opt/celerytalk >/dev/null 2>&1 && cd /opt/celerytalk/setup >/dev/null 2>&1 && eval bash install.sh >/dev/null 2>&1 & PID=$!
      printf "["
      while kill -0 $PID 2> /dev/null; do
      printf  "▓"
      sleep 5
      done
      printf "] done!"
      echo
      echo -ne "$(blueprint '[*]Install celerytalk Done')"
      echo
    fi
    echo -ne "
    $(yellowprint 'All Installs Done')
    $(redprint 'Press enter to continue ... ')"
    read response

   return 1
}

wireless_nw_tools() {
    # install airgeddon
    if [[ -n $(find / -name airgeddon.sh) ]]; then
      echo -ne "$(cyanprint '[+]airgeddon already installed - skipping')"
      echo
    else
      echo -ne "$(greenprint '[+]Installing airgeddon')"
      echo
    eval git clone --depth 1 https://github.com/v1s1t0r1sh3r3/airgeddon.git /opt/airgeddon >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "] done!"
    echo
    echo -ne "$(blueprint '[*]Install airgeddon Done')"
    echo
    fi

    # install fluxion
    if [[ -n $(find / -name fluxion.sh) ]]; then
      echo -ne "$(cyanprint '[+]fluxion already installed - skipping')"
      echo
    else
      echo -ne "$(greenprint '[+]Installing fluxion')"
      echo
    eval git clone https://www.github.com/FluxionNetwork/fluxion.git /opt/fluxion >/dev/null 2>&1 & PID=$!
    printf "["
    while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 5
    done
    printf "] done!"
    echo
    echo -ne "$(blueprint '[*]Install fluxion Done')"
    echo
  fi
  echo -ne "
  $(yellowprint 'All Installs Done')
  $(redprint 'Press enter to continue ... ')"
  read response

 return 1
  }

  Transport_tools() {
        # install testssl
        if [[ -n $(find / -name testssl.sh) ]]; then
          echo -ne "$(cyanprint '[+]testssl already installed - skipping')"
          echo
        else
          echo -ne "$(greenprint '[+]Installing testssl')"
          echo
        eval git clone --depth 1 https://github.com/drwetter/testssl.sh.git /opt/airgeddon >/dev/null 2>&1 & PID=$!
        printf "["
        while kill -0 $PID 2> /dev/null; do
        printf  "▓"
        sleep 5
        done
        printf "] done!"
        echo
        echo -ne "$(blueprint '[*]Install testssl Done')"
        echo
        fi

        # install sslyze
        if [[ -n $(find / -name sslyze) ]]; then
          echo -ne "$(cyanprint '[+]sslyze already installed - skipping')"
          echo
        else
          echo -ne "$(greenprint '[+]Installing sslyze')"
          echo
        eval pip install --upgrade setuptools pip >/dev/null 2>&1 && eval pip install --upgrade sslyze >/dev/null 2>&1  & PID=$!
        printf "["
        while kill -0 $PID 2> /dev/null; do
        printf  "▓"
        sleep 5
        done
        printf "] done!"
        echo
        echo -ne "$(blueprint '[*]Install sslyze Done')"
        echo
      fi
      echo -ne "
      $(yellowprint 'All Installs Done')
      $(redprint 'Press enter to continue ... ')"
      read response

     return 1
      }

Protocol_tools() {
            # install Dshell
            if [[ -n $(find / -name Dshell) ]]; then
              echo -ne "$(cyanprint '[+]Dshell already installed - skipping')"
              echo
            else
              echo -ne "$(greenprint '[+]Installing Dshell')"
              echo
            eval python3 -m pip install Dshell >/dev/null 2>&1 & PID=$!
            printf "["
            while kill -0 $PID 2> /dev/null; do
            printf  "▓"
            sleep 5
            done
            printf "] done!"
            echo
            echo -ne "$(blueprint '[*]Install Dshell Done')"
            echo
            fi
          echo -ne "
          $(yellowprint 'All Installs Done')
          $(redprint 'Press enter to continue ... ')"
          read response

         return 1
}

Hash_tools() {
            # install duplicut
            if [[ -n $(find / -name duplicut) ]]; then
              echo -ne "$(cyanprint '[+]duplicut already installed - skipping')"
              echo
            else
              echo -ne "$(greenprint '[+]Installing duplicut')"
              echo
            eval git clone https://github.com/nil0x42/duplicut /opt/duplicut >/dev/null 2>&1 & PID=$!
            printf "["
            while kill -0 $PID 2> /dev/null; do
            printf  "▓"
            sleep 5
            done
            printf "] done!"
            echo
            echo -ne "$(blueprint '[*]Install duplicut Done')"
            echo
            fi
            # install hate_crack
            if [[ -n $(find / -name wordlist_optimizer.py) ]]; then
              echo -ne "$(cyanprint '[+]hate_crack already installed - skipping')"
              echo
            else
              echo -ne "$(greenprint '[+]Installing hate_crack')"
              echo
            eval git clone https://github.com/trustedsec/hate_crack.git /opt/hate_crack >/dev/null 2>&1 & PID=$!
            printf "["
            while kill -0 $PID 2> /dev/null; do
            printf  "▓"
            sleep 5
            done
            printf "] done!"
            echo
            echo -ne "$(blueprint '[*]Install hate_crack Done')"
            echo
            fi

          echo -ne "
          $(yellowprint 'All Installs Done')
          $(redprint 'Press enter to continue ... ')"
          read response

         return 1
}

Exp_tools() {
            # install unicorn
            if [[ -n $(find / -name unicorn.py) ]]; then
              echo -ne "$(cyanprint '[+]unicorn already installed - skipping')"
              echo
            else
              echo -ne "$(greenprint '[+]Installing unicorn')"
              echo
            eval git clone https://github.com/trustedsec/unicorn.git /opt/unicorn >/dev/null 2>&1 & PID=$!
            printf "["
            while kill -0 $PID 2> /dev/null; do
            printf  "▓"
            sleep 5
            done
            printf "] done!"
            echo
            echo -ne "$(blueprint '[*]Install unicorn Done')"
            echo
            fi
            # install pwntools
            if [[ -n $(find / -name pwntools) ]]; then
              echo -ne "$(cyanprint '[+]pwntools already installed - skipping')"
              echo
            else
              echo -ne "$(greenprint '[+]Installing pwntools')"
              echo
            eval python3 -m pip install --upgrade pwntools >/dev/null 2>&1 & PID=$!
            printf "["
            while kill -0 $PID 2> /dev/null; do
            printf  "▓"
            sleep 5
            done
            printf "] done!"
            echo
            echo -ne "$(blueprint '[*]Install pwntools Done')"
            echo
            fi

          echo -ne "
          $(yellowprint 'All Installs Done')
          $(redprint 'Press enter to continue ... ')"
          read response

         return 1
}

Exfil() {
            # install trevorc2
            if [[ -n $(find / -name trevorc2_server.py) ]]; then
              echo -ne "$(cyanprint '[+]trevorc2 already installed - skipping')"
              echo
            else
              echo -ne "$(greenprint '[+]Installing trevorc2')"
              echo
            eval git clone https://github.com/trustedsec/trevorc2.git /opt/trevorc2 >/dev/null 2>&1 & PID=$!
            printf "["
            while kill -0 $PID 2> /dev/null; do
            printf  "▓"
            sleep 5
            done
            printf "] done!"
            echo
            echo -ne "$(blueprint '[*]Install trevorc2 Done')"
            echo
            fi

          echo -ne "
          $(yellowprint 'All Installs Done')
          $(redprint 'Press enter to continue ... ')"
          read response

         return 1
}

Install_PenTest() {

     cd /opt
    # CHECK2=/opt
     #if ! [ -d "$CHECK2" ]
     #then
     #mkdir PentestTools

   #fi
     echo -ne "
     $(yellowprint 'Installing Pentest tools')"
     echo
     echo
     ##
     ##install docker
     ##
     if ! [ -x "$(command -v docker)" ]
	   then
     echo -ne "
     $(greenprint '[+]Installing Docker')"
     echo
     printf "%s\n" "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-ce-archive-keyring.gpg] https://download.docker.com/linux/debian buster stable" \ | sudo tee /etc/apt/sources.list.d/docker-ce.list & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "]"
     echo
     curl -fsSL https://download.docker.com/linux/debian/gpg \ | gpg --dearmor \ | sudo tee /usr/share/keyrings/docker-ce-archive-keyring.gpg & PID=$!
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
     sudo apt install -y docker-ce docker-ce-cli containerd.io >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "] done!"
     echo
     echo -ne "
     $(blueprint 'Install Docker Done')"
     echo
   else
     sleep 0.5
     echo -ne "$(cyanprint '[+]Docker already installed - skipping')"
     echo
     fi
     ##
     ## install gobuster
     ##
     if ! [ -x "$(command -v gobuster)" ]
     then
     echo -ne "
     $(greenprint '[+]Installing gobuster')"
     echo
     apt install -y gobuster >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "] done!"
     echo
     echo -ne "
     $(blueprint 'Install gobuster Done')"
     echo
   else
     sleep 0.5
     echo -ne "$(cyanprint '[+]gobuster already installed - skipping')"
     echo
     fi
     ##
     ## install pip3
     ##
     if ! [ -x "$(command -v pip3)" ]
     then
     echo -ne "
     $(greenprint '[+]Installing pip3')"
     echo
     apt install -y python3-pip >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "] done!"
     echo
     echo -ne "
     $(blueprint 'Install pip3 Done')"
     echo
   else
     sleep 0.5
     echo -ne "$(cyanprint '[+]pip3 already installed - skipping')"
     echo
     fi
     ##
     ## install ffuf
     ##
     if ! [ -x "$(command -v pip3)" ]
     then
     echo -ne "
     $(greenprint '[+]Installing ffuf')"
     echo
     sudo apt install -y ffuf >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "] done!"
     echo
     echo -ne "
     $(blueprint 'Install ffuf Done')"
     echo
   else
     sleep 0.5
     echo -ne "$(cyanprint '[+]ffuf already installed - skipping')"
     echo
     fi
     ##
     ## install PEASS-ng
     ##
     CHECK=/opt/privilege-escalation-awesome-scripts-suite
     if [ -d "$CHECK" ]
  	 then
     echo -ne "
     $(greenprint '[+]Installing PEASS-ng')"
     echo
	 	 git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git /opt/privilege-escalation-awesome-scripts-suite >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "] done!"
     echo
     echo -ne "
     $(blueprint 'Install PEASS-ng Done')
     $(blueprint "SAVED ON $(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")")"
     echo
   else
     sleep 0.5
     echo -ne "$(cyanprint '[+]PEASS-ng already installed - skipping')"
     echo
     fi
     ##
     ## install Reverse Shell Generator - rsg
     ##
     if ! [ -x "$(command -v rsg)" ]
     then
     echo -ne "
     $(greenprint '[+]Installing Reverse Shell Generator - rsg')"
     echo
     cd /opt
     git clone https://github.com/mthbernardes/rsg.git >/dev/null 2>&1 && cd rsg && sh install.sh >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "] done!"
     echo
     echo -ne "
     $(blueprint 'Install Reverse Shell Generator - rsg Done')
     $(blueprint "SAVED ON $(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")")"
     echo
   else
     sleep 0.5
     echo -ne "$(cyanprint '[+]Reverse Shell Generator already installed - skipping')"
     echo
     fi
     ##
     ## install nmap-vulners
     ##
     CHECK1=/opt/nmap-vulners
     if [ -d "$CHECK" ]
  	 then
     echo -ne "
     $(greenprint '[+]Installing nmap-vulners')"
     echo
     cd /opt
     git clone https://github.com/vulnersCom/nmap-vulners.git >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "]"
     echo
     cd nmap-vulners && cp http-vulners-regex.nse /usr/share/nmap/scripts/ >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "]"
     echo
     cp http-vulners-regex.json /usr/share/nmap/nselib/data/ >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "]"
     echo
		 cp http-vulners-paths.txt /usr/share/nmap/nselib/data/ >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "]"
     echo
     wget https://svn.nmap.org/nmap/scripts/clamav-exec.nse -O /usr/share/nmap/scripts/clamav-exec.nse >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "]"
     echo
     nmap --script-updatedb >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "] done!"
     echo
     cd ../
     echo -ne "
     $(blueprint 'Install nmap-vulners Done')
     $(blueprint "SAVED ON $(cd "$(dirname "$1")"; pwd -P)/$(basename "$1") AND NMAP UPDATED WITH IT")"
     echo
   else
     sleep 0.5
     echo -ne "$(cyanprint '[+]nmap-vulners already installed - skipping')"
     echo
     fi
     ##
     ## install go
     ##
     if ! [ -x "$(command -v go)" ]
  	 then
     echo -ne "
     $(greenprint '[+]Installing go')"
     echo
     apt install -y golang >/dev/null 2>&1 && export GOROOT=/usr/lib/go >/dev/null 2>&1 && export GOPATH=$HOME/go >/dev/null 2>&1 && export PATH=$GOPATH/bin:$GOROOT/bin:$PATH >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "] done!"
     echo
     echo -ne "
     $(blueprint 'Install go Done')"
     echo
   else
     sleep 0.5
     echo -ne "$(cyanprint '[+]go already installed - skipping')"
     echo
     fi
     ##
     ## install aquatone
     ##
     if ! [ -x "$(command -v aquatone)" ]
  	 then
     echo -ne "
     $(greenprint '[+]Installing aquatone')"
     echo
     cd /opt
     git clone https://github.com/michenriksen/aquatone.git >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "]"
     echo
     cd aquatone
     go get github.com/michenriksen/aquatone >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "]"
     echo
     mv ~/go/bin/aquatone . >/dev/null 2>&1
     ln -sf /opt/aquatone/aquatone /usr/bin/aquatone >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "] done!"
     echo
     echo -ne "
     $(blueprint 'Install aquatone Done')"
     echo
   else
     sleep 0.5
     echo -ne "$(cyanprint '[+]aquatone already installed - skipping')"
     echo
     fi
     ##
     ## install unfurl
     ##
     if ! [ -x "$(command -v unfurl)" ]
    then
     echo -ne "
     $(greenprint '[+]Installing UnFURL')"
     echo
     cd /opt
     git clone https://github.com/tomnomnom/unfurl.git >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "]"
     echo
     cd unfurl && go get -u github.com/tomnomnom/unfurl >/dev/null 2>&1
     mv /root/go/bin/unfurl /opt/unfurl/ >/dev/null 2>&1
		 ln -sf /opt/unfurl/unfurl /usr/bin/unfurl >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "] done!"
     echo
     echo -ne "
     $(blueprint 'Install UnFURL Done')"
     echo
   else
     sleep 0.5
     echo -ne "$(cyanprint '[+]UnFURL already installed - skipping')"
     echo
     fi
     ##
     ## install crackmapexec
     ##
     if ! [ -x "$(command -v crackmapexec)" ]
    then
     echo -ne "
     $(greenprint '[+]Installing crackmapexec')"
     echo
     apt install crackmapexec -y >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "] done!"
     echo
     echo -ne "
     $(blueprint 'Install crackmapexec Done')"
     echo
   else
     sleep 0.5
     echo -ne "$(cyanprint '[+]crackmapexec already installed - skipping')"
     echo
     fi
     ##
     ## install threader3000
     ##
     if ! [ -x "$(command -v threader3000)" ]
    then
     echo -ne "
     $(greenprint '[+]Installing threader3000')"
     echo
     pip3 install threader3000 >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "] done!"
     echo
     echo -ne "
     $(blueprint 'Install threader3000 Done')"
     echo
   else
     sleep 0.5
     echo -ne "$(cyanprint '[+]threader3000 already installed - skipping')"
     echo
     fi
     ##
     ## install seclists
     ##
     if ! [ -x "$(command -v seclists)" ]
    then
     echo -ne "
     $(greenprint '[+]Installing seclists')"
     echo
     apt install seclists -y >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "]"
     echo
     cat /usr/share/seclists/Discovery/DNS/dns-Jhaddix.txt | head -n -14 > /tmp/clean-jhaddix-dns.txt >/dev/null 2>&1 & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "]"
     echo
     mv /tmp/clean-jhaddix-dns.txt /usr/share/seclists/Discovery/DNS/clean-jhaddix-dns.txt >/dev/null 2>&1  & PID=$!
     printf "["
     while kill -0 $PID 2> /dev/null; do
     printf  "▓"
     sleep 5
     done
     printf "] done!"
     echo
     echo -ne "
     $(blueprint 'Install seclists Done')"
     echo
   else
     sleep 0.5
     echo -ne "$(cyanprint '[+]seclists already installed - skipping')"
     echo
     fi

     echo -ne "
     $(yellowprint 'All Installs Done')
     $(redprint 'Press enter to continue ... ')"
     read response

    return 1
}



back() {
    bash KALIPRP.sh
}


menuItems=(
    "1.  Web vulnerability scanners"
    "2.  Network Vulnerability Scanners"
    "3.  Wireless Network Tools"
    "4.  Transport Layer Security Tools"
    "5.  Protocol Analyzers and Sniffers"
#    "6.  File Format Analysis Tools"
    "6.  Hash Cracking Tools"
    "7.  Exploit Development Tools"
    "8.  Exfiltration Tools"
    "9.  Best Tools Collection (Recommended)"
    "Q. Back  "
)

menuActions=(
    web_vulnerability_tools
    net_vulnerability_tools
    wireless_nw_tools
    Transport_tools
    Protocol_tools
    Hash_tools
    Exp_tools
    Exfil
    Install_PenTest
    back
)

menuTitle=" Select pentest tools to be installed:"
menuFooter=" Enter=Select, Navigate via Up/Down/number/letter"
menuWidth=50
menuLeft=10
menuHighlight=$DRAW_COL_YELLOW

menuInit
menuLoop


exit 0
