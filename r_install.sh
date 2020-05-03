#! /bin/bash

# Install R
## Add R repository
sudo echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" | sudo tee -a /etc/apt/sources.list
## Add R to Ubuntu keyring
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
## Install R base
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install r-base r-base-dev
set -e

# Install R studio server
echo '##### Installing R Studio #####'
wget https://download2.rstudio.org/rstudio-server-1.1.442-amd64.deb
sudo gdebi rstudio-server-1.1.442-amd64.deb
sudo rstudio-server verify-installation
set -e

# Install R shiny server
install_shiny='false'
for arg in "$@"
do
    case $arg in
        --shiny)
        install_shiny='true'
        shift
        ;;
    esac
done

if $install_shiny; then
    echo '##### Installing R Shiny #####'
    ## Install shiny at system level
    sudo su - -c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""
    ## Install server
    wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.6.875-amd64.deb
    sudo gdebi shiny-server-1.5.6.875-amd64.deb

set -e

# sudo apt-get install -y libcurl4-openssl-dev
# sudo apt-get install -y libxml2-dev
# sudo apt-get install -y openjdk-7-jdk
# export LD_LIBRARY_PATH=/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server
# sudo R CMD javareconf

# sudo nano /usr/lib/R/etc/Renviron
# R_LIBS_USER=${R_LIBS_USER-‘~/R/x86_64-pc-linux-gnu-library/3.0’}
# R_LIBS_USER=${R_LIBS_USER-‘~/Library/R/3.0/library’}

#R
#.libPaths()

# sudo chmod 777 /usr/lib/R/site-library

#R
#install.packages(c('RJDBC', 'RJSONIO', 'rmarkdown', 'dplyr'))

#sudo apt-get install -y gdebi-core
#sudo wget http://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.3.0.403-amd64.deb
#sudo gdebi shiny-server-1.3.0.403-amd64.deb

#sudo chmod -R 777 /srv

