#!/bin/bash

#  download_genomes.sh
#  interactive script to produce the desired datasets, based on which grouping is relavent
#  uses .sb slurm scripts in /mnt/home/lueckeda/scripts/slurm/data_download_scripts to wget files from NCBI or Ensembl, or cp from research/
#  Created by David Luecke on 10/22/18.
#

### make the directory for downloaded data to be stored in scratch/ ###
#cd $SCRATCH # for using on HPCC
cd /Users/davidluecke/scratch/users/"$USER" # for writing/testing on my local machine

if [ ! -d data_downloads ]; then
    mkdir data_downloads
    echo "created directory /mnt/ls15/scratch/users/$USER/data_downloads"
fi
cd data_downloads

### prompt user to define which subset of data they want, and set variables as appropriate ###

while true; do
    read -p "Do you want ALL species? (y/n): " ALL
    [[ $ALL == 'n' ]] && read -p "Do you want ALL SPECIES WITH GENOME available? (y/n): " ALLGENOME
    [[ $ALL == 'y' || $ALL == 'n' ]] && break || echo "enter y or n"
done

if [[ $ALL = 'n' && $ALLGENOME = 'n' ]]; then
while true; do
    read -p "Do you want only TEST SET species (Paramormyrops, Zebrafish, Gar, Human)? (y/n): " TESTING
    [[ $TESTING == 'y' ]] && break || read -p "Do you want ALL ELECTROGENIC species? (y/n): " ELECTRO
    [[ $ELECTRO == 'y' ]] && break || read -p "Do you want ALL NON-ELECTROGENIC species? (y/n): " NONELECTRO
    [[ $NONELECTRO == 'y' ]] && break || read -p "Do you want ALL TELEOST species? (y/n): " TELEOST
    [[ $TELEOST == 'y' ]] && break || read -p "Do you want ALL NON-TELEOST species? (y/n): " NONTELEOST
    [[ $NONTELEOST == 'y' ]] && break || read -p "Do you want ALL FRESHWATER species? (y/n): " FRESH
    [[ $FRESH == 'y' ]] && break || read -p "Do you want ALL SALTWATER species? (y/n): " SALT
    [[ $SALT == 'y' ]] && break || echo "Out of options!"
done
fi

while true; do
    read -p "Do you want GENOMES where available? (y/n): " GENOME
    [[ $GENOME == 'y' || $GENOME == 'n' ]] && break || echo "enter y or n"
done

while true; do
    read -p "Do you want TRANSCRIPTOMES where available? (y/n): " TRANSCRIPTOME
    [[ $TRANSCRIPTOME == 'y' || $TRANSCRIPTOME == 'n' ]] && break || echo "enter y or n"
done

while true; do
    read -p "Do you want PROTEOMES where available? (y/n): " PROTEOME
    [[ $PROTEOME == 'y' || $PROTEOME == 'n' ]] && break || echo "enter y or n"
done

### function to perform the data download steps, takes string for directory name and string for species signifier in .sb file name ###
get_data () {
    if [[ ! -d $1 ]]; then
        mkdir $1
        echo "created directory /mnt/ls15/scratch/users/$USER/data_downloads/$1/"
    fi
    cd $1
    [[ $GENOME == 'y' ]] && eval touch $2GetGenome.sb
    [[ $TRANSCRIPTOME == 'y' ]] && eval touch $2GetTranscriptome.sb
    [[ $PROTEOME == 'y' ]] && eval touch $2GetProteome.sb
    cd ..
}

### implementing get_data function based on which set of data was requested ###

if [[ $TESTING == 'y' ]]; then
    get_data Mormyridae Pking
    get_data Cyprinidae Dreri
    get_data Holostei Locul
    get_data Amniota Hsapi
fi

if [[ $ALLGENOME == 'y' ]]; then
    get_data Mormyridae Pking
    get_data Cyprinidae Dreri
    get_data Holostei Locul
    get_data Gymnotiform Eelec
    get_data Osteoglossidae Sform
    get_data Siluriform Ipunc
    get_data Rajiform Lerin
    get_data Holocephali Cmili
    get_data Amniota Hsapi
fi

if [[ $ALL == 'y' || $ELECTRO == 'y' || $TELEOST == 'y' || $FRESH == 'y' ]]; then
    get_data Mormyridae Pking
    get_data Gymnotiform Eelec
fi

if [[ $ALL == 'y' || $NONELECTRO == 'y' || $TELEOST == 'y' || $FRESH == 'y' ]]; then
    get_data Cyprinidae Dreri
    get_data Osteoglossidae Sform
    get_data Siluriform Ipunc
fi

if [[ $ALL == 'y' || $ELECTRO == 'y' || $TELEOST == 'y' || $SALT == 'y' ]]; then
    get_data Astroscopus Astar
fi

if [[ $ALL == 'y' || $NONELECTRO == 'y' || $TELEOST == 'y' || $SALT == 'y' ]]; then
    get_data Holostei Locul
fi

if [[ $ALL == 'y' || $NONELECTRO == 'y' || $TELEOST == 'y' || $FRESH == 'y' ]]; then
    echo nothing
fi

if [[ $ALL == 'y' || $ELECTRO == 'y' || $NONTELEOST == 'y' || $SALT == 'y' ]]; then
    get_data Rajiform Lerin
fi

if [[ $ALL == 'y' || $NONELECTRO == 'y' || $NONTELEOST == 'y' || $SALT == 'y' ]]; then
    get_data Holocephali Cmili
fi


