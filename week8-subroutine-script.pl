#!/usr/bin/perl

#week8-subroutine-script.pl

use warnings;

#input file will be taeda_unigenes.fasta
open(IN, shift(@ARGV)) or die "Can't read file.\n";
open(OUT, ">week8-subroutine-out.txt") or die "Can't report first output\n";


%gene_hash = ();


while(<IN>){
   chomp;    
   $id = $_;
   $id =~ s/\s.*//g;
   $seq = <IN>; 
   chomp($seq);
   $gene_hash{$id}=$seq;
}


foreach $id (sort keys %gene_hash){
   $out_len = calc_len($gene_hash{$id}); 
   $out_GC = calc_GC($gene_hash{$id});
   $out_melt = calc_melt($gene_hash{$id});
   print(OUT "$id\tGene length: $out_len\tGC content: $out_GC\tMelting temp: $out_melt\n");
}


#1. calculate the length of a sequence
sub calc_len {
    my $seq = shift(@_);
    my $seq_length = length($seq);
    return($seq_length);
}

#2. calculate the GC content of a sequence
sub calc_GC { 
    my $seq = shift(@_);
    my $seq = uc($seq); 				
    my $G = $seq =~ tr/G/G/; 		
    my $C = $seq =~ tr/C/C/; 		
    my $GC = ($G+$C)/length($seq); 
    return($GC); 
}

#3. calculate the melting temperature of a sequence.
sub calc_melt {
    #For sequences longer than 13 nucleotides, the melting temp equation used is
    #melt_temp = 64.9 + 41*(G+C-16.4)/(A+T+G+C) 
    my $seq = shift(@_);
    my $A = $seq =~ tr/A/A/;  
    my $C = $seq =~ tr/C/C/;  
    my $G = $seq =~ tr/G/G/;  
    my $T = $seq =~ tr/T/T/;  
    #my $melt_temp = 2*($A+$T) + 4*($C+$G);
    my $melt_temp = 64.9 + 41*($G+$C-16.4)/($A+$T+$G+$C);
    return($melt_temp);
} 

