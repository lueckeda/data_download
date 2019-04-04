#!/bin/bash

# copy_genomic_data.sh copies data from /mnt/research/efish into scratch/data_download space and decompresses if necessary
# maintains directory structure from download_genomes.sh
# intend to allow download_genomes.sh to have option to run this script

cd $SCRATCH 

if [ ! -d data_downloads ]; then
    mkdir data_downloads
fi
cd data_downloads

### Mormyrids ###
if [[ ! -d Mormyridae ]]; then
	mkdir Mormyridae
fi
cd Mormyridae

# Brienomyrus
cp /mnt/research/efish/lab_data/assemblies/genomes/b_brachyistius/Brienomyrus_brachyistius_Supernova_Assembly_1kb_min_scaffold.fasta Brienomyrus_brachyistius_genome.fa
cp /mnt/research/efish/lab_data/assemblies/transcriptomes/mormyriformes/brienomyrus/sm_eo_pe_assembly/Trinity.fasta Brienomyrus_brachyistius_trinity.fa

# Campylomormyrus
cp /mnt/research/efish/lab_data/assemblies/transcriptomes/mormyriformes/campylomormyrus/normalized_assemblies/campylormormyrus_trinity_normalized/Trinity.fasta Campylomormyrus_trinity.fa

# Mormyrops
cp /mnt/research/efish/lab_data/assemblies/transcriptomes/mormyriformes/mormyrops/MNIG_6656/Trinity.fasta Mormyrops_nigricans_trinity.fa

# Petrocephalus
cp /mnt/research/efish/2016_quantification/transcriptomes/petrocephalus_trinity.fasta Petrocephalus_soudanensis_trinity.fa

# Paramormyrops
cp /mnt/research/efish/lab_data/assemblies/transcriptomes/mormyriformes/paramormyrops/PMAG/PMAG1/Trinity.fasta Paramormyrops_magnostipes_1_trinity.fa

cd ..


### Gymnarchidae ###
if [[ ! -d Gymnarchidae ]]; then
	mkdir Gymnarchidae
fi
cd Gymnarchidae

# Gymnarchus
cp /mnt/research/efish/lab_data/assemblies/transcriptomes/mormyriformes/gymnarchus/Trinity.fasta Gymnarchus_niloticus_trinity.fa

cd ..


### Gymnotiform ###
if [[ ! -d Gymnotiform ]]; then
	mkdir Gymnotiform
fi
cd Gymnotiform

# Brachyhypopomus
cp /mnt/research/efish/lab_data/assemblies/genomes/B_gauderio/Brachyhypopomus_gauderio_Supernova_2.0_1Kb_Min_Scaffold.fasta Brachyhypopomus_gauderio_genome.fa
cp /mnt/research/efish/lab_data/assemblies/transcriptomes/gymnotiformes/brachyhypopomus/b_gauderio_04202016_trinity.fasta Brachyhypopomus_gauderio_trinity.fa

# Apteronotus
cp /mnt/research/efish/lab_data/assemblies/transcriptomes/gymnotiformes/apteronotus/apteronotus_skin_trinity.fasta Apteronotus_trinity.fa

# Eigenmannia
gunzip -c /mnt/research/efish/lab_data/assemblies/transcriptomes/gymnotiformes/eigenmannia/eigen-trinity.fasta.gz > Eigenmannia_virescens_trinity.fa

# Sternopygus
gunzip -c /mnt/research/efish/lab_data/assemblies/transcriptomes/gymnotiformes/sternopygus/sterno_trinity_0.1.fa.gz > Sternopygus_macrurus_trinity.fa

# Electrophorus
cp /mnt/research/efish/lab_data/assemblies/transcriptomes/gymnotiformes/electrophorus/Genome-based-assembly/Ee_soap_1.4.CDS.fa Electrophorus_electricus.CDS.fa
cp /mnt/research/efish/lab_data/assemblies/transcriptomes/gymnotiformes/electrophorus/Genome-based-assembly/Ee_soap_1.4.pro.fa Electrophorus_electricus.proteome.fa
cd ..


### Uranoscopidae ###
if [[ ! -d Uranoscopidae ]]; then
	mkdir Uranoscopidae
fi
cd Uranoscopidae

# Astroscopus
cp /mnt/research/efish/lab_data/assemblies/transcriptomes/perciformes/stargazer/trinity_stargazer/Trinity.fasta Astroscopus_trinity.fa

cd ..


### Malapteruridae ###
if [[ ! -d Malapteruridae ]]; then
	mkdir Malapteruridae
fi
cd Malapteruridae

# Malapterus
cp /mnt/research/efish/lab_data/assemblies/transcriptomes/siluriformes/malapterurus/Trinity.fasta Malapterurus_trinity.fa

cd ..


### Torpediniformes ###
if [[ ! -d Torpediniformes ]]; then
	mkdir Torpediniformes
fi
cd Torpediniformes

# Narcine
cp /mnt/research/efish/lab_data/assemblies/transcriptomes/torpeniformes/normalized_assemblies/narcine_trinity_normalized/Trinity.fasta Narcine_trinity.fa

# Torpedo 
cp /mnt/research/efish/lab_data/assemblies/transcriptomes/torpeniformes/normalized_assemblies/torpedo_trinity_normalized/Trinity.fasta Torpedo_trinity.fa











