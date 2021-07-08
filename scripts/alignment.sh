#!/bin/bash -l

## Do alignment using bwa
../tools/bwa-0.7.17/bwa mem -t 15 -M \
	../reference/hg38.fa \
	SRR622461_1.fastq SRR622461_2.fastq 1> ../outputs/bam/test_sample.sam 2> ../outputs/bam/test_log.txt

## Convert sam file to bam files
../tools/samtools-1.12/samtools view -bS ../outputs/bam/test_sample.sam > ../outputs/bam/test_sample.bam 

## Sort the bam files
../tools/samtools-1.22/samtools sort -@ 20 ../outputs/bam/test_sample.bam -o ../outputs/bam/test_sample.sorted.bam 

## Markduplications
java -jar ../tools/picard/build/libs/picard.jar MarkDuplicates \
      I=../outputs/bam/test_sample.sorted.bam \
      O=../outputs/bam/marked_duplicates.sorted.bam \
      M=../outputs/bam/test_sample_marked_dup_metrics.txt 

## Correct the bam file
java -jar ../tools/picard/build/libs/picard.jar FixMateInformation \
       I=../outputs/bam/marked_duplicates.sorted.bam \
       O=../outputs/bam/fixed_mate.bam \
       ADD_MATE_CIGAR=true

## Generate the Index for bam file

../tools/samtools-1.22/samtools index ../outputs/bam/fixed_mate.bam


## Correct the qualify score

../tools/gatk-4.2.0.0 BaseRecalibrator \
   -I ../outputs/bam/fixed_mate.bam \
   -R ../reference/hg38.fa \
   --known-sites sites_of_variation.vcf \
   --known-sites another/optional/setOfSitesToMask.vcf \
   -O recal_data.table



### Next steps ###
