#!/usr/bin/perl

use strict;
use warnings;

my @regel;
my $naam = "ng1_PCA";

open(FILE, "${naam}.txt");
while (my $line = <FILE>)
{
  chomp $line;
  @regel = split(/,/,$line);
  foreach my $i (1,5,10,20,50,100,200){
	maak_matrix($i);
  }
}

sub maak_matrix
{
  my ($matrixregel,$p);
  my $count = shift;
  open(OUT, ">>${naam}_$count.txt");
  
  $matrixregel = "";
  for ($p = 0; $p < $count; $p++)
  {
    $matrixregel = $matrixregel.",$regel[$p]";
  }
  $matrixregel =~ s/^,([0-9]*.*)/$1/;
  print OUT "$matrixregel\n";
}
