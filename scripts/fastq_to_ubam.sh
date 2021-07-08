#!/bin/bash -l
java -jar ../tools/picard/build/libs/picard.jar FastqToSam \
      F1=../fastq/SRR622461_1.fastq \
      F2=../fastq/SRR622461_2.fastq \
      O=../outputs/ubam/unaligned_read_pairs.bam \
      SM=test_sample \
      RG=test_sample_group


