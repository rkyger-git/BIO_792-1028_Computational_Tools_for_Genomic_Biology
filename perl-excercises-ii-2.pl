#!/usr/bin/perl

#perl-excercises-ii-2

use warnings;

$list = shift(@ARGV);

print($list, "\n");

@list = split(",", $list);

print(@list, "\n");

push(@list, "1");
push(@list, "2");
push(@list, "3");

print(@list, "\n");

$A = shift(@list);

print(@list, "\n");

$last = pop(@list);
$last = pop(@list);

print(@list, "\n");

$length = @list;
print($length, "\n");

if ($length>4) {
    die "Array is too long.\n"
}

@revlist = reverse(@list);
print(@revlist, "\n");

$list2 = join(",", @list);
print($list2, "\n");