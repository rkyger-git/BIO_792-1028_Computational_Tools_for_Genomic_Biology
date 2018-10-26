#!/usr/bin/perl

#restr-and-sat-finder-2.pl

use warnings;

#open(IN, shift(@ARGV)) or die "Can't read file.\n";
open(REPORT, ">restr-and-sat-finder-report-file.txt") or die "Can't report first output\n";

$count = 0;
$Ecocount = 0;
$Mescount = 0;
$Hindcount = 0;
$ATAcount = 0;
$ATCcount = 0;
$ATNcount = 0;

foreach $file (@ARGV){
    
    open(IN, "<$file") or die "Can't read file.\n";
    open(OUT, ">sat_seq_$file.txt") or die "Can't report file.\n";

    while(<IN>){
        chomp;
        if (m/^>/){
            $count++;
        }
        if (m/GAATTC/){
            $eco = () = $_ =~ m/GAATTC/g;
            $Ecocount = $Ecocount + $eco;
        }
        if (m/TTAA/){
            $mes = () = $_ =~ m/TTAA/g;
            $Mescount = $Mescount + $mes;
        }
        if (m/AAGCTT/){
            $hind = () = $_ =~ m/AAGCTT/g;
            $Hindcount = $Hindcount + $hind;
        }
        if (m/(AT){5,}/){
            $AT = () = $_ =~ m/(AT){5,}/g;
            $ATAcount = $ATAcount + $AT;
            print(OUT "$_\n");
        }
        if (m/(ATC){5,}/){
            $ATC = () = $_ =~ m/(ATC){5,}/g;
            $ATCcount = $ATCcount + $ATC;
            print(OUT "$_\n");
        }
        if (m/(AT*){5,}/){
            $ATN = () = $_ =~ m/(AT*){5,}/g;
            $ATNcount = $ATNcount + $ATN;
            print(OUT "$_\n");
        }
    }
    print(REPORT "$file has $count sequences in total.\n");
    print(REPORT "$file has $Ecocount total EcoRI sites.\n");
    print(REPORT "$file has $Mescount total Mes1 sites.\n");
    print(REPORT "$file has $Hindcount total HindIII sites.\n");
    print(REPORT "$file has $ATAcount total ATA repeats.\n");
    print(REPORT "$file has $ATCcount total ATC repeats.\n");
    print(REPORT "$file has $ATNcount total ATN repeats.\n");
    
    close(IN);
    close(OUT);
}
