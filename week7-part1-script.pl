#!/usr/bin/perl

#week7-part1-script.pl

use warnings;

open(IN, shift(@ARGV)) or die "Can't read file.\n";
open(OUT, ">week7-out-while.txt") or die "Can't report first output\n";
open(OUT2, ">week7-out-foreach.txt") or die "Can't report first output\n";

%gene_hash = ();
%gene_length = ();

while(<IN>){
   chomp;    
   $id = $_;  
   $seq = <IN>; 
   
   $gene_hash{$id}=$seq;
   
   $len = length($seq);
   $gene_length{$id}=$len;

}

@gene_hash_id = keys %gene_hash;
@gene_hash_seq = values %gene_hash;

@gene_length_id = keys %gene_length;
@gene_length_len = values %gene_length;

while (($gene_length_id, $gene_length_len) = each %gene_length) {
    print(OUT "$gene_length_id $gene_length_len \n");
   }

foreach $name (sort keys %gene_length){
	print(OUT2 "$name $gene_length{$name}\n");
   }
