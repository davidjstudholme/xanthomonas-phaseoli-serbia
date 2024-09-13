### Download all the sequence reads from the SRA database using NCBI's SRA Toolkit
fasterq-dump --split-files SRR24958746 SRR24958747 SRR24958748 SRR24958749

### Compress the downloaded FASTQ files
for i in *.fastq; do echo $i; gzip $i; done

### Perform TrimGalore on each dataset
for i in  SRR24958746 SRR24958747 SRR24958748 SRR24958749 ; do echo $i; trim_galore -q 30 --paired  $i*_1.fastq.gz $i*_2.fastq.gz; done


### Perform Unicycler assembly for each dataset
#conda activate unicycler_env
for i in  SRR24958746 SRR24958747 SRR24958748 SRR24958749 ; do echo $i;  ./unicycler-runner.py -1 $i"_1_val_1.fq.gz"  -2 $i"_2_val_2.fq.gz" -o $i.unicycler; done

### Create symbolic links to resulting assemblies
for i in   SRR24958746 SRR24958747 SRR24958748 SRR24958749; do echo $i; ln -s $i.unicycler/assembly.fasta $i.unicycler.assembly.fasta; done



