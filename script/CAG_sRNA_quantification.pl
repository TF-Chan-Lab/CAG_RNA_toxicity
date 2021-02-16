#!/bin/perl
#Author: ALin
#Purpose: To count CAG sRNA from fastq files.
#Usage: <STDIN> | perl CAG_sRNA_quantification.pl <out>

use strict;

if(@ARGV != 1){
	print "Usage: <STDIN> | perl CAG_sRNA_quantification.pl <out>\n";
	exit;
}

my $out = shift @ARGV;

open(OUT, ">$out") or die "Cannot create $out!\n";

my %CAG = ();
my %sequence = (
			'C' => "A",
			'A' => "G",
			'G' => "C",
		);

OUTTER:while(<>){
	chomp;
	my $line = $_;
	unless($line =~ /^[ATCGN]/){
		next OUTTER;
	}
	my @line = split('', $line);
	my $length = @line;
	for(my $i = 0; $i < ($length - 1); $i++){
		if($line[$i+1] ne $sequence{$line[$i]}){
			next OUTTER;
		}
	}
	unless(exists $CAG{$line}){
		$CAG{$line} = 0;
	}
	$CAG{$line}++;
}

print OUT "Sequence\tCount";

foreach my $sRNA (keys %CAG){
	print OUT "\n$sRNA\t$CAG{$sRNA}"
}
close OUT;



