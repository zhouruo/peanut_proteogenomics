#!urs/bin/perl


open F ,  "./../1.novelgene/ncbi_genomics_all_gene.gff";
while (<F>){
    chomp;
    @aa=split/\t/,$_;
        push @{$start{$aa[0]}},$aa[3];
        $st=$aa[0].".".$aa[3];
        $end{$st}=$aa[4];
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
         $ss=$2;$ee=$3;$ch=$1;$avg=($ss+$ee)/2;
         foreach (@{$start{$ch}}){
             $st=$_;
             $id=$1.".".$st;
             $ed=$end{$id};
         
             if (($ss <$st  && $ee  > $st)  ||  ($ss <$ed  && $ee  > $ed) ){
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
             if ($st<$ss  && $ee <$ed ){#   && $ps{$id} ne   $strand{$real}){
                 $pse=$ch.":".$st."-".$ed;
                 #print  "$pse\t$line\n";
             }
         }
      }
   }
