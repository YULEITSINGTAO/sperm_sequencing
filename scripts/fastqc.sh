#!/bin/bash -l

### Get the fastq files PATH list
find ../fastq -type f | grep ".">file_names.txt

../tools/FastQC/fastqc file_names.txt --extract --outdir=../outputs/fastQC 
