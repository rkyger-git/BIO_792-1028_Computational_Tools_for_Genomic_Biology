#!/usr/bin/perl

#perl-excercises-ii-3.pl

use warnings;

@nums = qw(2 3 4 5 6 7 8 12 15 17 20 22);

$count = 0;

foreach $x (@nums){
    $count++;
    if ($x % 2 == 0) {
        print($x*2,",", $count-1,",even\n");
    }
    else{
        print($x*2,",", $count-1,",odd\n");
    }
}
print("The final count is ", $count, ".\n")

#unix redirection: perl perl-excercises-ii-3.pl > output-ii-3.txt
