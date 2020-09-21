# CAG_RNA_toxicity
This repository is for depositing codes used in the manuscript, titled "CAG RNAs induce DNA damage and apoptosis by silencing NUDT16 expression in polyglutamine degeneration".

Three customized scripts were designed for analysis small CAG RNAs using small RNA-seq data. The usages of the three scripts are as following.

1. CAG_sRNA_quantification.pl
This script intends to identify all sequences containing only "CAG" from a .fastq file, typically from small RNA-seq (sRNA-seq). The script accepts an standard input and out a two-column file, with the first column showing the unique "CAG"-containing sequences and the second one as the unique read count. Assuming the file name of a .fastq file is "sRNA_seq.fastq" and the output file is "output.txt", the usage is as following.

cat sRNA_seq.fastq | perl CAG_sRNA_quantification.pl output.txt

2. sRNA_quantification.pl
This script intends to count the unique sequences in a .fastq file, typically from sRNA-seq. The script accepts an standard input and out a two-column file, with the first column showing the unique sequences and the second one as the unique read count. Assuming the file name of a .fastq file is "sRNA_seq.fastq" and the output file is "output.txt", the usage is as following.

cat sRNA_seq.fastq | perl sRNA_quantification.pl output.txt

3. combine_htseq_counts.pl
This script intends to merge the read counts of unique sequences generated by sRNA_quantification.pl and construct a count table for all samples. The input files contains a list of output files from sRNA_quantification.pl, which are to be merged. In this input file, each line is the exact pathway to a file. The output file is a table containing the read counts of all unique sequences for all samples. The mean, median, variance and the square of the coefficient of variation will also be calculated and output as the last columns. Assuming "input_list.txt" as the input file and "output.txt" as the output file, the usage is as following.

perl combine_htseq_counts.pl input_list.txt output.txt

In the analysis of the above mentioned manuscript, the read counts of all unique sequences for all samples, excluding the columns of the mean, median, variance and the square of the coefficient of variation, are used as the input for DESeq2 as mentioned in the Online Methods session of the manuscript.
