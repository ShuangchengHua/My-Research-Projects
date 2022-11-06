#!/bin/sh

input=/projects/rpci/qzhu/xinyu/mywork/skatO_case_control/output/cleaned_dataset/cleaned_all_dataset
output=/projects/rpci/qzhu/xinyu/mywork/skatO_case_control/output/cleaned_dataset/cleaned_rare_variants

# filter SNPs by maxmaf -> --max-maf 0.01 -> rare variants

module use /projects/rpci/modules
module load plink/1.07

upper_bound=0.01 

pop="ALLcasecontrol_cohort1 ALLcasecontrol_cohort2 AMLMDScasecontrol_cohort1 AMLMDScasecontrol_cohort2"
for i in $pop
do 
	plink --bfile $input/CLEAN.$i \
	      --max-maf $upper_bound \
              --make-bed \
              --out $output/CLEAN.rare.$i \
	      --noweb	
done
