## combine the gtf  genome A and B
cat  ./official_files/GCF_000816755.2_Araip1.1_genomic.gtf    ./official_files/GCF_000817695.2_Aradu1.1_genomic.gtf >combine.gtf

###  hisat2 alignment
/genomics_tools/hisat2/hisat2-2.0.5/hisat2 \
           -x /database/PeanutMix/GenomeHisat2Index/chrALL \
           -1 \
           /Peanut_rna/raw/rawdata/L70_1_1/L70_1_1_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_1_2/L70_1_2_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_1_3/L70_1_3_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_2_1/L70_2_1_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_2_2/L70_2_2_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_2_3/L70_2_3_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_3_1/L70_3_1_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_3_2/L70_3_2_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_3_3/L70_3_3_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_4_1/L70_4_1_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_4_2/L70_4_2_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_4_3/L70_4_3_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_5_1/L70_5_1_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_5_2/L70_5_2_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_5_3/L70_5_3_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_6_1/L70_6_1_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_6_2/L70_6_2_1.fq.gz,./project/Peanut_rna/raw/rawdata/L70_6_3/L70_6_3_1.fq.gz \
           -2 \
           ./project/Peanut_rna/raw/rawdata/L70_1_1/L70_1_1_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_1_2/L70_1_2_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_1_3/L70_1_3_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_2_1/L70_2_1_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_2_2/L70_2_2_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_2_3/L70_2_3_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_3_1/L70_3_1_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_3_2/L70_3_2_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_3_3/L70_3_3_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_4_1/L70_4_1_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_4_2/L70_4_2_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_4_3/L70_4_3_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_5_1/L70_5_1_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_5_2/L70_5_2_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_5_3/L70_5_3_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_6_1/L70_6_1_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_6_2/L70_6_2_2.fq.gz,./project/Peanut_rna/raw/rawdata/L70_6_3/L70_6_3_2.fq.gz \
     -t -p 15 --known-splicesite-infile PeanutMix.splicesites.txt --novel-splicesite-outfile Low.splicesites.tab -S ./Low.sam


## StringTie
./software/genomics_tools/stringtie-1.3.3.Linux_x86_64/stringtie  -p 12 -G ./project/Peanut_rna/pga/combine.gtf -o Low.gtf -l Low Low.sorted.bam


#  Construct  novel transcript DB by PGA package
R --slave <<'EOF'
source("./workspace/docker_workspace/deepxomics/polypep/Auxtools/createProDB4DenovoRNASeq.R")
createProDB4DenovoRNASeq(infa="Low.novel.fa",bool_get_longest=F,make_decoy=F, outfile_name="Low.combine", outmtab="Low.NTX.tab", outfa="Low.NTX.fa")
EOF

R --slave <<'EOF'
source("./workspace/docker_workspace/deepxomics/polypep/Auxtools/createProDB4DenovoRNASeq.R")
createProDB4DenovoRNASeq(infa="High.novel.fa",bool_get_longest=F,make_decoy=F, outfile_name="High.combine", outmtab="High.NTX.tab", outfa="High.NTX.fa")
EOF


#  Construct  prediction  DB by  Augustus
./augustus --species=arabidopsis --strand=both --singlestrand=false --genemodel=complete  --codingseq=on --sample=100 --keep_viterbi=true --alternatives-from-sampling=true --minexonintronprob=0.08 --minmeanexonintronprob=0.4 --maxtracks=3 ./commercial/proteomics/genome/GCF_000817695.2_Aradu1.1_genomic.fna   --exonnames=on --gff3=on  >genomeA_Aradu_new_gff3.gff
./augustus --species=arabidopsis --strand=both --singlestrand=false --genemodel=complete --codingseq=on --sample=100 --keep_viterbi=true --alternatives-from-sampling=true --minexonintronprob=0.08 --minmeanexonintronprob=0.4 --maxtracks=3 ./commercial/proteomics/genome/GCF_000816755.2_Araip1.1_genomic.fna   --exonnames=on  --gff3=on    >genomeB_Araip_new_gfff3.gff

