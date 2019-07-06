#!urs/bin/perl
open F , $ARGV[0];
system ("mkdir -p  A_Aradu");
system ("mkdir -p B_Araip");

open A , ">A_Aradu/input.txt";
open B , ">B_Araip/input.txt";
while (<F>){
    chomp;
    @aa=split/\t/,$_;
    if ($aa[1]=~/genomeA_Aradu_(.+)_(\d+)/){
        $id=$1.".t".$2;
        print   A   "$aa[0]\t$id\n";
        system ("grep '$id' ./genomeA_Aradu_new.gff |grep 'exon'  >A_Aradu/$id.gtf");    # Augustus predict gff result
        system ("./software/cufflinks-2.2.1.Linux_x86_64/gffread -w A_Aradu/$id.fa -g ./database/PeanutMix/chrALL.fa A_Aradu/$id.gtf -W");  # peanut genomeA whole genome
    }
    if ($aa[1]=~/genomeB_Araip_(.+)_(\d+)/){
        $id=$1.".t".$2;
        print   B   "$aa[0]\t$id\n";
        system ("grep '$id'   ./genomeB_Araip_new.gff |grep 'exon'  >B_Araip/$id.gtf");  # Augustus predict gff result
        system ("./software/cufflinks-2.2.1.Linux_x86_64/gffread -w B_Araip/$id.fa -g ./database/PeanutMix/chrALL.fa B_Araip/$id.gtf -W");  # peanut genomeB whole genome
    }
}
system ("cat A_Aradu/*fa  >A_Aradu/all.fa");
system ("cat B_Araip/*fa  >B_Araip/all.fa");
system ("./PgaTools/bin/map2genome -i A_Aradu/input.txt -d A_Aradu/all.fa");
system ("./PgaTools/bin/map2genome -i B_Araip/input.txt -d B_Araip/all.fa");
