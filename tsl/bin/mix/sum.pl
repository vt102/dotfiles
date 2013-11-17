#!/usr/bin/perl

@num = <STDIN>;
$sum = 0;

foreach $i (@num) {
	$sum = $sum + $i;
}

print $sum,"\n";
