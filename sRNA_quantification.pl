#!/bin/perl
#Author: ALin
#Purpose: To count sRNA from fastq files.
#Usage: <STDIN> | perl sRNA_quantification.pl <out>

use strict;

if(@ARGV != 1){
	print "Usage: <STDIN> | perl sRNA_quantification.pl <out>\n";
	exit;
}

my $out = shift @ARGV;

open(OUT, ">$out") or die "Cannot create $out!\n";

my %sRNA = ();

OUTTER:while(<>){
	chomp;
	my $line = $_;
	unless($line =~ /^[ATCGN]+$/){
		next OUTTER;
	}
	unless(exists $sRNA{$line}){
		$sRNA{$line} = 0;
	}
	$sRNA{$line}++;
}

print OUT "Sequence\tCount";

foreach my $sRNA (keys %sRNA){
	print OUT "\n$sRNA\t$sRNA{$sRNA}"
}
close OUT;



