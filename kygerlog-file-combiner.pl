#!/usr/bin/perl

#log-file-combiner.pl

use warnings;

open(OUT, ">out-logfiles-combined.txt") or die "Can't report first output\n";
open(OUT2, ">mean_temp.txt") or die "Can't report second output\n";



foreach my $file (@ARGV){ ##TLP: added my fir scope.

    open(IN, "<$file") or die "Can't read file.\n";
    $file =~ /(\d+)_(\w\d+)_(\w)_(\d+)\.txt/;

    my $info = "$1,"."$2,"."$3,"."$4,"; ##TLP: added print statement to check info.
    #print "$info\n";##TLP just checking these variables.
   
    
    my @dates = (); ##TLP: moved this from above. You want to empty and declare arrays before opening each file handle
    my @times = ();
    my @AMPM = ();
    my @temperature = ();
    
    <IN>;
    while(<IN>){
        chomp;
        $_ =~ s/\0//g; ##TLP:added g here for global. This was actually the spot creating the biggest problem. You had lots of "\0"s remaining in the scalar lines.

        my @line = split(/\s/, $_);
	    push(@dates, $line[1]);
	    push(@times, $line[2]);
	    push(@AMPM, $line[3]);
	    push(@temperature, $line[4]);

       
    }

    ##TLP: Moved these statements from above. You want them outside your while loop; you only want to join them AFTER you have processed the whole file. In other words, you want to have these arrays finalized ONCE for each file.
    my $da = join(",", @dates);
    my $ti = join(",", @times);
    my $ampm = join(",", @AMPM);
    my $temp = join(",", @temperature);

    my $ctr=0;
    my $tempsum;
    my $meantemp;
    foreach(@temperature){
        #print "$_\n";
	$tempsum += $_; #simplify, TLP
	$ctr++;
    }

    #$lentemp = @temperature; TLP simplified above.

    $meantemp = $tempsum / $ctr;

    print(OUT "$1,$2,$3,$4,$da\n");
    print(OUT "$1,$2,$3,$4,$ti\n");
    print(OUT "$1,$2,$3,$4,$ampm\n");
    print(OUT "$1,$2,$3,$4,$temp\n");
    print(OUT2 "$1,$2,$3,$4,$meantemp\n");

    close(IN);

    @dates = ();
    @times = ();
    @AMPM = ();
    @temperature = ();
}
