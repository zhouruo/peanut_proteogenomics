#!urs/bin/perl

open S ,  "/mnt/n1p3/commercial/proteomics/2018/20180315_peanut_PGA/all_novel_nojunc/blast/location/all_strand";
while (<S>){
    chomp;
    @aa=split/\t/,$_;
    $id=$aa[0]."-".$aa[1];
    $strand{$id}=$aa[3];
}


open F ,  "/mnt/n1p3/commercial/proteomics/2018/20180315_peanut_PGA/all_novel/location/ncbi_genomics_all_gene.gff";
while (<F>){
    chomp;
    @aa=split/\t/,$_;
    if ($aa[2]  eq 'gene' ){
        push @{$start{$aa[0]}},$aa[3];
        $st=$aa[0].".".$aa[3];
        $end{$st}=$aa[4];
        $ps{$st}=$aa[6];
    }
}

open G ,$ARGV[0];
 while (<G>){
     chomp;
     @aa=split/\t/,$_;
     $line=$_;
     if ($aa[1]=~/^\d/){
         @id=split/;/,$aa[3];
         $real=$aa[0]."-".$id[0];
     }
     if ($aa[1]!~/^\d/){
         $real=$aa[0]."-".$aa[1];
     }
     if ($aa[2]=~/(.+):(\d+)-(\d+)$/){
         $ss=$2;$ee=$3;$ch=$1;
         foreach (@{$start{$ch}}){
             $st=$_;
             $id=$1.".".$st;
             $ed=$end{$id};
             if ($st<$ss  && $ee <$ed ){# && $ps{$id} ne  $strand{$real}){
                 $pse=$ch.":".$st."-".$ed;
                 print  "$pse\t$line\n";
             }

         }
     }
     if ($aa[2]=~/(.+):(\d+)-(\d+),(\d+)-(\d+)/){
         $ss=$2;$ee=$5;$ch=$1;
         foreach (@{$start{$1}}){
             $st=$_;
             $id=$1.".".$st;
             $ed=$end{$id};
             if ($st<$ss  && $ee <$ed ){#   && $ps{$id} ne  $strand{$real}){
                 $pse=$ch.":".$st."-".$ed;
                  print  "$pse\t$line\n";
             }
         }
      }
   }
