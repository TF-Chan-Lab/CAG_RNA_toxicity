# CAG_RNA_toxicity
This repository is for depositing codes used in the manuscript, titled "CAG RNAs induce DNA damage and apoptosis by silencing NUDT16 expression in polyglutamine degeneration".

Three customized scripts were designed for analysis small CAG RNAs using small RNA-seq data. The usages of the three scripts are as following.

1. CAG_sRNA_quantification.pl
This script intends to identify all sequences containing only "CAG" from a .fastq file, typically from small RNA-seq (sRNA-seq). The script accepts an standard input and out a two-column file, with the first column showing the unique "CAG"-containing sequences and the second one as the unique read count. Assuming the file name of a .fastq file is "sRNA_seq.fastq" and the output file is "output.txt". The usage is as following.

cat sRNA_seq.fastq | perl CAG_sRNA_quantification.pl output.txt

2. sRNA_quantification.pl
This script intends to count the unique sequences in a .fastq file, typically from sRNA-seq. The script accepts an standard input and out a two-column file, with the first column showing the unique sequences and the second one as the unique read count. Assuming the file name of a .fastq file is "sRNA_seq.fastq" and the output file is "output.txt". The usage is as following.

cat sRNA_seq.fastq | perl sRNA_quantification.pl output.txt

