#!urs/bin/perl
#@peps=glob("../../peanut_iTRAQ_new/ipeak_*/*/*/*peptideSummary.txt");
#foreach (@peps){
   open F ,  $ARGV[0];
   open O , ">tmp";
   print  O  "index\tpeptide\tcharge\tscore\tprotein\n";
   while (<F>){
        chomp;
        if (/^index=/){
            @aa=split/\t/,$_;
            print O "$aa[0]\t$aa[7]\t$aa[4]\t$aa[13]\t$aa[9]\n";
        }
   }
   close O;
   close F;
   system ("perl ./convert.pl tmp   >tmp_new");
   system ("java -cp ./pga.jar  cn.bgi.FDRcalculator  tmp_new   ./db.fa    \"###REV###\" VAR 0 0 ./");    
   system ("grep -v  'XP_'  pga-peptideSummary.txt  |awk -F  '\t'  '{print \$9}' |grep -v  'peptide' |sort -u  >novel_peptide");




