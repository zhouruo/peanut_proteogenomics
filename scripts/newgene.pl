#!urs/bin/perl
my $start=0;
$tmp=0;
open F ,  "./ncbi_genomics_all_gene.gff";
while (<F>){
    chomp;
    @aa=split/\t/,$_;
    if ($tmp ne  $aa[0]){$start=0;}
    push @{$start{$aa[0]}},$start;
    $ss=$aa[0]."-".$start;
    $end{$ss}=$aa[3];
    $start=$aa[4];
    $tmp=$aa[0];
}

open G ,$ARGV[0];
 while (<G>){
     chomp;
     @aa=split/\t/,$_;
     $line=$_;
     if ($aa[2]=~/(.+):(\d+)-(\d+)$/){
         $ss=$2;$ee=$3;$ch=$1;
         foreach (@{$start{$1}}){
             $st=$_;
             $id=$1."-".$st;
             $ed=$end{$id};
             if ($st<$ss  && $ee <$ed ){
                 $pse=$ch.":".$st."-".$ed;
                 print  "$pse\t$line\n";
             }

         }
     }
     if ($aa[2]=~/(.+):(\d+)-(\d+),(\d+)-(\d+)/){
         $ss=$2;$ee=$5;$ch=$1;
         foreach (@{$start{$1}}){
             $st=$_;
             $id=$1."-".$st;
             $ed=$end{$id};
             if ($st<$ss  && $ee <$ed ){
                 $pse=$ch.":".$st."-".$ed;
                 print  "$pse\t$line\n";
             }
         }
      }
   }
