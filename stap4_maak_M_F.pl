#pak alle bestanden
my @files = <C:/Users/Nander/Desktop/ng1_PCA_*>;
my $count = @files;

my ($file);

foreach $file (@files)
{
  open(FILE, "$file");
  $file =~ s/(.*).txt$/$1/;
  open(OUT, ">${file}_FM.txt");

  my($line,$line_no);

  $line_no = 0;
  while ($line = <FILE>)
  {
    $line_no ++;
    chomp $line;
    if ($line_no <=320)
    {
      print OUT "$line,F\n";
    }
    else
    {
      print OUT "$line,M\n";
    }
  }
}