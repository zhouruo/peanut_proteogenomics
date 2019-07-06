#Search  by Msgfplus    Dataset 1,2,3,4
/usr/bin/java -Xmx30G -jar ./software/proteomics_tools/search/msgfplus/MSGFPlus.jar  -m 3  -maxLength 45  -n 1  -o ./commercial/proteomics/search/peanut_iTRAQ_new/output_1/msgfplus/liang_iTRAQ_1-001_20160330.wiff.mzid  -ti 0,0  -mod ./commercial/proteomics/.search/peanut_iTRAQ_new/output_1/msgfplus/Mods.txt  -minLength 7  -addFeatures 1  -s ./commercial/proteomics/.search/peanut_iTRAQ_new/./1/liang_iTRAQ_1-001_20160330.wiff.mgf  -t 0.1Da  -minCharge 2  -maxCharge 3  -tda 0  -d ./commercial/proteomics/.search/peanut_iTRAQ_new/output_1/database/target_decoy.fasta  -protocol 2  -ntt 2  -inst 2  -e 1
/usr/bin/java -Xmx30G -jar ./software/proteomics_tools/search/msgfplus/MSGFPlus.jar  -m 3  -maxLength 45  -n 1  -o ./output_176_1/msgfplus/liang_iTRAQ_176-01_20160427.wiff.mzid  -ti 0,0  -mod ./output_176_1/msgfplus/Mods.txt  -minLength 7  -addFeatures 1  -s ././mgf_176_1/liang_iTRAQ_176-01_20160427.wiff.mgf  -t 0.1Da  -minCharge 2  -maxCharge 3  -tda 0  -d ./output_176_1/database/target_decoy.fasta  -protocol 2  -ntt 2  -inst 2  -e 1
/usr/bin/java -Xmx30G -jar ./software/proteomics_tools/search/msgfplus/MSGFPlus.jar  -m 1  -maxLength 45  -n 1  -o ./output_1_new/msgfplus/F001490.dat-pride.pride.mzid  -ti 0,0  -mod /mnt/n1p3/commercial/proteomics/2018/20180315_peanut_PGA/search/LF_data/output_1_new/msgfplus/Mods.txt  -minLength 7  -addFeatures 1  -s /mnt/n1p3/commercial/proteomics/2018/20180315_peanut_PGA/search/LF_data/./F001490.dat-pride.pride.mgf  -t 20.0ppm  -minCharge 2  -maxCharge 3  -tda 0  -d /mnt/n1p3/commercial/proteomics/2018/20180315_peanut_PGA/search/LF_data/output_1_new/database/target_decoy.fasta  -protocol 5  -ntt 2  -inst 0  -e 1
/usr/bin/java -Xmx30G -jar ./software/proteomics_tools/search/msgfplus/MSGFPlus.jar  -m 1  -maxLength 45  -n 1  -o ./lF_data2/output_c1/msgfplus/Sample1.mzid  -ti 0,0  -mod /mnt/n1p3/commercial/proteomics/2018/20180315_peanut_PGA/search/lF_data2/output_c1/msgfplus/Mods.txt  -minLength 7  -addFeatures 1  -s /mnt/n1p3/commercial/proteomics/2018/20180315_peanut_PGA/search/lF_data2/./Control-R1/Sample1.mgf  -t 2.0Da  -minCharge 2  -maxCharge 3  -tda 0  -d /mnt/n1p3/commercial/proteomics/2018/20180315_peanut_PGA/search/lF_data2/output_c1/database/target_decoy.fasta  -protocol 5  -ntt 2  -inst 0  -e 1


#Search by  Myrimatch
./software/proteomics_tools/search/myrimatch/myrimatch  -MaxPeptideLength 45  -StaticMods "C 57.021464 ( 304.20536 K 304.20536"  -MaxResultRank 1  -MinTerminiCleavages 2  -CleavageRules Trypsin  -MinPeptideLength 7  -DecoyPrefix ""  -MonoisotopeAdjustmentSet 0  -OutputSuffix _myrimatch  -MinPeptideMass 0.0  -MaxPeptideMass 10000.0  -PrecursorMzToleranceRule mono  -FragmentationRule cid  -workdir  ./commercial/proteomics/.search/peanut_iTRAQ_new/output_1/myrimatch  -MaxDynamicMods 3  -NumChargeStates 3  -FragmentMzTolerance 0.05daltons  -DynamicMods "M * 15.994915 Y * 304.20536"  -MaxMissedCleavages 1  -MonoPrecursorMzTolerance 0.1daltons  -OutputFormat mzIdentML  -ProteinDatabase ./commercial/proteomics/.search/peanut_iTRAQ_new/output_1/database/target_decoy.fasta  ./commercial/proteomics/.search/peanut_iTRAQ_new/./1/liang_iTRAQ_1-001_20160330.wiff.mgf
./software/proteomics_tools/search/myrimatch/myrimatch  -MaxPeptideLength 45  -StaticMods "C 57.021464 ( 304.20536 K 304.20536"  -MaxResultRank 1  -MinTerminiCleavages 2  -CleavageRules Trypsin  -MinPeptideLength 7  -DecoyPrefix ""  -MonoisotopeAdjustmentSet 0  -OutputSuffix _myrimatch  -MinPeptideMass 0.0  -MaxPeptideMass 10000.0  -PrecursorMzToleranceRule mono  -FragmentationRule cid  -workdir  ./output_176_1/myrimatch  -MaxDynamicMods 3  -NumChargeStates 3  -FragmentMzTolerance 0.05daltons  -DynamicMods "M * 15.994915 Y * 304.20536"  -MaxMissedCleavages 1  -MonoPrecursorMzTolerance 0.1daltons  -OutputFormat mzIdentML  -ProteinDatabase ./output_176_1/database/target_decoy.fasta  ././mgf_176_1/liang_iTRAQ_176-01_20160427.wiff.mgf
./software/proteomics_tools/search/myrimatch/myrimatch  -MaxPeptideLength 45  -StaticMods "C 57.021464"  -MaxResultRank 1  -MinTerminiCleavages 2  -CleavageRules Trypsin  -MinPeptideLength 7  -DecoyPrefix ""  -MonoisotopeAdjustmentSet 0  -OutputSuffix _myrimatch  -MinPeptideMass 0.0  -MaxPeptideMass 10000.0  -PrecursorMzToleranceRule mono  -FragmentationRule cid  -workdir  ./output_1_new/myrimatch  -MaxDynamicMods 3  -NumChargeStates 3  -FragmentMzTolerance 0.6daltons  -DynamicMods "M * 15.994915 N * 0.984016 Q * 0.984016"  -MaxMissedCleavages 1  -MonoPrecursorMzTolerance 20.0ppm  -OutputFormat mzIdentML  -ProteinDatabase /mnt/n1p3/commercial/proteomics/2018/20180315_peanut_PGA/search/LF_data/output_1_new/database/target_decoy.fasta  /mnt/n1p3/commercial/proteomics/2018/20180315_peanut_PGA/search/LF_data/./F001490.dat-pride.pride.mgf
./software/proteomics_tools/search/myrimatch/myrimatch  -MaxPeptideLength 45  -StaticMods "C 57.021464"  -MaxResultRank 1  -MinTerminiCleavages 2  -CleavageRules Trypsin  -MinPeptideLength 7  -DecoyPrefix ""  -MonoisotopeAdjustmentSet 0  -OutputSuffix _myrimatch  -MinPeptideMass 0.0  -MaxPeptideMass 10000.0  -PrecursorMzToleranceRule mono  -FragmentationRule cid  -workdir  ./output_c1/myrimatch  -MaxDynamicMods 3  -NumChargeStates 3  -FragmentMzTolerance 0.2daltons  -DynamicMods "M * 15.994915"  -MaxMissedCleavages 1  -MonoPrecursorMzTolerance 2.0daltons  -OutputFormat mzIdentML  -ProteinDatabase /mnt/n1p3/commercial/proteomics/2018/20180315_peanut_PGA/search/lF_data2/output_c1/database/target_decoy.fasta  /mnt/n1p3/commercial/proteomics/2018/20180315_peanut_PGA/search/lF_data2/./Control-R1/Sample1.mgf

#search by X!tandem
./software/proteomics_tools/search/tandem-linux-15-04-01-1/bin/tandem.exe ./commercial/proteomics/search/peanut_iTRAQ_new/output_1/tandem/iTRAQ_1-001.wiff_input.xml
./software/proteomics_tools/search/tandem-linux-15-04-01-1/bin/tandem.exe ./output_176_1/tandem/liang_iTRAQ_176-01_20160427.wiff_input.xml
./software/proteomics_tools/search/tandem-linux-15-04-01-1/bin/tandem.exe ./LF_data/output_1_new/tandem/F001490.dat-pride.pride_input.xml
./software/proteomics_tools/search/tandem-linux-15-04-01-1/bin/tandem.exe ./lF_data2/output_c1/tandem/Sample1_input.xml