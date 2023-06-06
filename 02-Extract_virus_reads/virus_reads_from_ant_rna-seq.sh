########################################################
## Author: Anindita Brahma
## Queen Mary University of London
## All rights reserved
#######################################################

## Required for extracting virus reads from RNA-Seq 
module load kraken/2.0.8

## Command for single-end reads
kraken2 --db kraken2_db --threads 8 --use-names --output sample_id.out --report sample_id.report input/sample_id.fastq.gz
## Command for paired-end reads
kraken2--db kraken2_db--threads 8 --paired --use-names--output sample_id.out --reportsample_id.report input/sample_id_R1.fastq.gz input/sample_id_R2.fastq.gz

## Extract virus reads assigned at various taxonomic levels from Kraken2 report
grep "viridae\|virales\|virus" sample_id.report > sample_id_viral_load.txt

## Repeat this step for all RNA-Seq samples
## sample_id_viral_load.txt will be used for all downstream analyses