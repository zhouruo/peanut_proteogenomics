#from search result, using seprateFDR method to get the novel peptide.
perl ./scripts/pga.pl  msgfplus-peptideSummary.txt      #output: novel_peptide 

#Validation the novel peptide by pepQuery

java -jar -Xmx30G ../PepQuery_v1.0.0/pepquery.jar -db ./peanut_nodup.fa    -fixMod 6 -varMod 107,142,143 -maxVar 3 -cpu 24  -fragmentMethod 1 -itol 0.6 -tol 20 -ms ./d1.mgf  -pep ./d1_novel_peptide  -m 1 -minScore 5 -n 10000  -um   -o d1_result
java -jar -Xmx30G ../PepQuery_v1.0.0/pepquery.jar -db ./peanut_nodup.fa   -fixMod 6 -varMod 107 -maxVar 3 -cpu 16  -fragmentMethod 1 -itol 0.2 -tol 20 -ms ./d2.mgf  -pep ./d2_novel_peptide   -m 1 -minScore 10 -n 10000 -um  -o d2_result
java -jar -Xmx80G ../PepQuery_v1.0.0/pepquery.jar -db ./peanut_nodup.fa    -fixMod 6,4,62 -varMod 107,84  -maxVar 3 -cpu 16  -fragmentMethod 1 -itol 0.05 -tol 10   -ms ./d3.mgf   -pep ./d3_novel_peptide  -m 1 -minScore 10 -n 10000  -o d3_result
java -jar -Xmx80G ../PepQuery_v1.0.0/pepquery.jar -db ./peanut_nodup.fa    -fixMod 6,4,62 -varMod 107,84  -maxVar 3 -cpu 24  -fragmentMethod 1 -itol 0.05 -tol 10   -ms ./d4.mgf   -pep ./d4_novel_peptide   -m 1 -minScore 10 -n 10000  -um  -o d4_result