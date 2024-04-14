# bamtofastq
### -- summary

![Pasted image 20240413212559 1](https://github.com/Alvis-Jiang/Bioinfo_tools/assets/64271338/7a2de0df-151c-4912-af77-d7d1ae6f8f64)

1. Quality control (QC) of input (bam/cram) files (FastQC).  
2. Check if input files are single- or paired-end (Samtools).  
3. Compute statistics on input files (Samtools).  
4. Convert to fastq reads (Samtools).  
5. QC of converted fastq reads (FastQC).  
6. Summarize QC and statistics before and after format conversion (MultiQC).


### -- installation 
```
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

conda create --name env_nf nextflow
conda activate env_nf
```
### -- Running 
```
# use the -profile conda in the Negishi 
nextflow run nf-core/bamtofastq --input samplesheet.csv --outdir ./results -profile conda

# parameter:  https://nf-co.re/bamtofastq/1.1.0/docs/usage
# --no_read_QC: skip FastQC on obtained reads
# --no_stats: Use to skip FastQC on both input bam and output reads, as well as all samtools flagstat, samtools idxstats, and samtools stats. This is useful for large datasets.
# --max_memory: Use to set a top-limit for the default memory requirement for each process. Should be a string in the format integer-unit. eg. --max_memory '8.GB'
# --max_cpus: Use to set a top-limit for the default CPU requirement for each process. Should be a string in the format integer-unit. eg. --max_cpus 1
```

```
# Running shell script


#!/bin/bash

cd /depot/pbaloni/data/Lab_members/Boyu_Jiang/RNA_Volecity/Fastq_BowmanLab

directory='/depot/pbaloni/data/Lab_members/Boyu_Jiang/RNA_Volecity/Fastq_BowmanLab/Input_files'

output_dir="/depot/pbaloni/data/Lab_members/Boyu_Jiang/RNA_Volecity/Fastq_BowmanLab/fastq_outputs/"

for file in "$directory"/*;do

    filepath="$file"

    filename=$(basename "$file")

    sampleid=$(echo "$filename" | sed 's/\.csv$//' | rev | cut -d '.' -f 2- | rev)

    echo "$sampleid"

    echo "$filepath"

    output_folder="$output_dir/$sampleid"

    echo "$output_folder"

    nextflow run nf-core/bamtofastq --no_stats --max_cpus 128 --max_memory '256.GB' --input "$filepath" --outdir "$output_folder" -profile conda

    echo '-----------------'

done
```
