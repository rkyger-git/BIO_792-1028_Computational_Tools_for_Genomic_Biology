#!/usr/bin/perl

#week7-passerina-hash.pl

use warnings;

open(IN, shift(@ARGV)) or die "Can't read file.\n";
open(OUT, ">week7-passerina-hash-out.txt") or die "Can't report first output\n";

%seqcount = ();

while(<IN>){
   chomp;    
   $id = $_; 
   $id =~ s/( -- \d+)//;

   $seqcount{$id}++;

   <IN>;
   <IN>;
   <IN>;
}

foreach $id (keys %seqcount){
	print(OUT "$id\t$seqcount{$id}\n");
   }

