#!urs/bin/perl
open H , "./pga/High.NTX.tab";  # new transcript mapping tab file 
while (<H>){
        chomp;
        if (/^NTX/){
            @aa=split/\t/,$_;
            $high{$aa[0]}=$aa[1];
        }
}
open L , "./pga/Low.NTX.tab";    #new transcript mapping tab file
while (<L>){
        chomp;
        if (/^NTX/){
            @aa=split/\t/,$_;
            $low{$aa[0]}=$aa[1];
        }
}
open HF, "./location/novel.fa";
while (<HF>){
        chomp;
LINE:    if (/^>([^\s]+)/){
            $id =$1;
            $tt=$_;
            $tt{$id}=$_;
            while (<HF>){
                chomp;
                if (/^>/){
                    goto LINE;
                }
                 else {$seq{$id}=$seq{$id}.$_;}}}}
                                                #                                                                                                                                                                $seq{$id}=$seq{$id}.$_;
                                                #                                                                                                                                                                                   }
                                                #                                                                                                                                                                                                   }
                                                #                                                                                                                                                                                                                }
                                                #                                                                                                                                                                                                                       }
                                                

open OUT,  ">NTX_input";
open FA,  ">ntx.fa";
open F , $ARGV[0];
while (<F>){
    chomp;
    @aa=split/\t/,$_;
    if ($aa[1]=~/(.+)_low/){
        $lp{$aa[0]}=$1;
        print  FA "$tt{$low{$1}}\n$seq{$low{$1}}\n";
        print  OUT "$aa[0]\t$low{$1}\n";
    }
    if ($aa[1]=~/(.+)_high/){
        $hp{$aa[0]}=$1;
        print  FA "$tt{$high{$1}}\n$seq{$high{$1}}\n";
        print  OUT "$aa[0]\t$high{$1}\n";
    }
}

