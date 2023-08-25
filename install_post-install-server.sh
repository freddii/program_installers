#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root"
	exit 1
else
	#Update and Upgrade
	echo "Updating and Upgrading"
	apt-get update && sudo apt-get upgrade -y

	sudo apt-get install dialog
	cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
	options=(1 "LAMP Stack" off
			2 "Build Essentials" off
			3 "Node.js" off
			4 "Git" off
			5 "Composer" off
			6 "JDK 8" off)
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	clear
	for choice in $choices
		do
			case $choice in
				1)
					#Install LAMP stack
					echo "Installing Apache"
					apt install apache2 -y

					echo "Installing Mysql Server"
					apt install mysql-server -y

					echo "Installing PHP"
					apt install php libapache2-mod-php php-mcrypt php-mysql -y

					echo "Installing Phpmyadmin"
					apt install phpmyadmin -y

					echo "Configuring apache to run Phpmyadmin"
					echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

					echo "Restarting Apache Server"
					service apache2 restart
					;;
				2)
					#Install Build Essentials
					echo "Installing Build Essentials"
					apt install -y build-essential
					;;

				3)
					#Install Nodejs
					echo "Installing Nodejs"
					curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
					apt install -y nodejs
					;;
				4)
					#Install git
					echo "Installing Git, please congiure git later..."
					apt install git -y
					;;
				5)
					#Composer
					echo "Installing Composer"
					EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
					php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
					ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

					if [ "$EXPECTED_SIGNATURE" = "$ACTUAL_SIGNATURE" ]
						then
							php composer-setup.php --quiet --install-dir=/bin --filename=composer
							RESULT=$?
							rm composer-setup.php
					else
						>&2 echo 'ERROR: Invalid installer signature'
						rm composer-setup.php
					fi
					;;

				6)
					#JDK 8
					echo "Installing JDK 8"
					apt install python-software-common -y
					add-apt-repository ppa:webupd8team/java -y
					apt update
					apt install oracle-java8-installer -y
					;;
		esac
	done
fi
