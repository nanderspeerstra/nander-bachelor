#!/usr/bin/perl

use strict;
use warnings;

my @regel;
my $naam = "ng1_PCA";

foreach my $i (1,5,10,20,50,100,200){
	open(FILE, "${naam}.txt");
	my $linecount = 1;
	open my $output_file, ">${naam}_$i.txt" or die "...$!";
	while (my $line = <FILE>) {
		chomp $line;
		@regel = split(/,/,$line);
		maak_matrix($i, $linecount, $output_file);
		$linecount++;
	}
}

sub maak_matrix
{
  my ($matrixregel,$p);
  my $count = shift;
  my $linecount = shift;
  my $OUT = shift;
  
  $matrixregel = "";
  for ($p = 0; $p < $count; $p++)
  {
    $matrixregel = $matrixregel.",$regel[$p]";
  }
  $matrixregel =~ s/^,([0-9]*.*)/$1/;
  print $OUT "$matrixregel,";
  if($linecount <= 320){
  	  print $OUT "F";
  } else {
  	  print $OUT "M";
  }
  print $OUT "\n";
}
