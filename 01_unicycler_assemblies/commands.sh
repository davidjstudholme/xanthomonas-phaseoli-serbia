### Download all the sequence reads from the SRA database using NCBI's SRA Toolkit
fasterq-dump --split-files SRR24958746 SRR24958747 SRR24958748 SRR24958749

### Perform TrimGalore on each dataset
for i in  SRR24958746 SRR24958747 SRR24958748 SRR24958749 ; do echo $i; trim_galore -q 30 --paired  $i*_1.fastq.gz $i*_2.fastq.gz; done


### Perform Unicycler assembly for each dataset
#conda activate uniycler_env
for i in  SRR24958746 SRR24958747 SRR24958748 SRR24958749 ; do echo $i;  ./unicycler-runner.py -1 $i"_1_val_1.fq.gz"  -2 $i"_2_val_2.fq.gz" -o $i.unicycler; done





