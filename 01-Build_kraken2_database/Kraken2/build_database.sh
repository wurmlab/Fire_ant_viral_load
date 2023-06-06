########################################################
## Author: Anindita Brahma
## Queen Mary University of London
## All rights reserved
#######################################################

## Required for building Kraken2 database:
module load kraken/2.0.8

## Download NCBI taxonomy database:
kraken2-build --download-taxonomy --threads 16 --db kraken2_db

## Download the default NCBI "nr" and "viral" libraries: 
kraken2-build --download-library nr --threads 16 --db kraken2_db
kraken2-build --download-library viral --threads 16 --db kraken2_db

## Add new insect viruses after formatting their fasta headers to include taxonomic identity.
## See new_insect_virus.Rmd for formatting fasta headers.
kraken2-build --add-to-library new_insect_virus.fa --db kraken2_db --threads 16

