# Pre-processing and RNA velocity analysis of single-cell RNA-seq data with kallisto|bustools

```
# Download reference files
# paht: /depot/pbaloni/data/Lab_members/Boyu_Jiang/RNA_Volecity/velocity_index/
%time
!wget https://ftp.ensembl.org/pub/release-98/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
!wget https://ftp.ensembl.org/pub/release-98/gtf/homo_sapiens/Homo_sapiens.GRCh38.98.gtf.gz
```

```
# Run terminal 
kb ref -i index.idx -g t2g.txt -f1 cdna.fa -f2 intron.fa -c1 cdna_t2c.txt -c2 intron_t2c.txt --workflow lamanno -t 64 /depot/pbaloni/data/Lab_members/Boyu_Jiang/RNA_Volecity/velocity_index/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz /depot/pbaloni/data/Lab_members/Boyu_Jiang/RNA_Volecity/velocity_index/Homo_sapiens.GRCh38.98.gtf.gz

-t thread
-c1 spliced_t2c(cdna_t2c).txt
-c2 unspliced_t2c(intron_t2c).txt
```

```
```
