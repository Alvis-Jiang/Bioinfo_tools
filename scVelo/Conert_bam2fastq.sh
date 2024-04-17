#!/bin/bash


directory='/depot/pbaloni/data/Bowman_scRNA/CD10_D150_MeHg'
output_dir='/depot/pbaloni/data/Lab_members/Boyu_Jiang/RNA_Volecity/fastq_genome10x'
for file in "$directory";do
	cd /depot/pbaloni/data/Bowman_scRNA/CD10_D150_MeHg

	foldername=$(basename "$file")
	filename='possorted_genome_bam.bam'
	filepath="$directory/$foldername"
	ouputpath="$output_dir/$foldername"
	cd $filepath
	echo $filepath
	echo $ouputpath
	
	/depot/pbaloni/data/Lab_members/Boyu_Jiang/Software/bamtofastq/bamtofastq_linux --nthreads=32 --reads-per-fastq=5000000000 possorted_genome_bam.bam $ouputpath

	echo '-----------------'
done

