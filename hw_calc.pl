#!/usr/bin/perl

#hw_calc.pl

#This program calculates the expected allele frequencies in a population under Hardy Weinberg Equillibrium.

use warnings;

($p, $q) = @ARGV;

$psquared = $p**2;
$twopq = 2 * $p * $q;
$qsquared = $q**2;

print("\nThe value for p^2 is $psquared, the value for 2pq is $twopq, the value for q^2 is $qsquared \n \n");

