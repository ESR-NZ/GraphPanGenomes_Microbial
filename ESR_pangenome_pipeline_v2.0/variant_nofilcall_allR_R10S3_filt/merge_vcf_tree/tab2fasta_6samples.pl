#!/usr/bin/env perl
# https://github.com/shenwei356/bio_scripts

use strict;

my @line1;
open FILE1,"$ARGV[0]"
    or die "Could not open file $ARGV[0]";

my @linelist=<FILE1>;

foreach my $eachline (@linelist)
{
    chomp $eachline;
    @line1 = split /\s+/, $eachline;
     print ">@line1[0]\n";
     print "@line1[1..50000]\n";
}
close FILE1;

