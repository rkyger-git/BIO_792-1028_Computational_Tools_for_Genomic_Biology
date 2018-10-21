#!/usr/bin/perl

#reformat_genotypes_prob4.pl

#usage: perl reformat_genotypes_prob4.pl [number of loci] [precision value]

##TLP: I added a usage statement just because I think its always a good idea.
use warnings;

open(IN, "gprob_ids_high.txt" ) or die "Can't read file.\n";
open(OUT, ">converted_gprob_ids_high.txt") or die "Can't report first output\n";

@data = <IN>;
($loci, $precval) = @ARGV;

foreach my $line (@data){
#while(<IN>){ ##TLP: note that when you assign <IN> to @data, you also then have to write a loop to go through that array. Using while(<IN>) instead is quicker, and also makes better use of memory if you are working with large data. 
    chomp;
    print "$line\n";
    
  ###TLP: what you were initially doing below wouldbt work because you were treating the ENTIRE line of data as $_. Because you need to operate on each "value" on that line, you need to be able to process the values 1 at a time. For this, you can use split to turn the line into an array, and then loop through the array
    my @geno=split(" ",$line);

    foreach(@geno[0..$loci]){
	if(/([A-Z]+)_([A-Z]+)/){
	    print OUT "$1 $2 ";
	}
	elsif($_ <= 0 + $precval){
	    print OUT " 0";
	}

#TLP: Below you need to use && for and equal to:
	elsif($_ >= 1 - $precval && $_ <= 1 + $precval){
	    print OUT " 1";
	}

    ##TLP: this was simpler because the values cant be greater than 2 to begin with.
	elsif($_ >= 2 - $precval){
	    print OUT " 2";
	}
	else{
	    print OUT " 9";
	}

    }
##TLP: need to add a line number after you have gone through the array containing genotypes from each line of the data file.
    print OUT "\n";
}


#@data=$ARGV[1]
#$loci=$ARGV[2]
#$precval=$ARGV[3]


#$numloc=1000;	
#foreach(@line[0..$numloc]){
#	    	print "$lek\n";


#while (<IN>) {
#    chomp;
#    if (/([A-Z]+)_([A-Z]+)/){
#    print OUT "$1 $2 ";
#    }
#}


#foreach(@linearray){
#	if (/([A-Z]+)_([A-Z]+)/){
#	    print OUT "$1 $2"; 
#	} 	
#	elsif ($_ < 0){
#	    print OUT " 0";
#	}	
#	elsif ………..
#}
