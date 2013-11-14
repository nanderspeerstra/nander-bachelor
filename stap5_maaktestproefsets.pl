my @files = <ng1_PCA_*>;
my $count = @files;

my ($file);

foreach $file (@files)
{

$file =~ s/(.*)\.txt/$1/;
open(FILE, "$file.txt");
open(OUTT05, ">${file}_05test.test");
open(OUTP05, ">${file}_05proef.train");
open(OUTT16, ">${file}_16test.test");
open(OUTP16, ">${file}_16proef.train");
open(OUTT27, ">${file}_27test.test");
open(OUTP27, ">${file}_27proef.train");
open(OUTT38, ">${file}_38test.test");
open(OUTP38, ">${file}_38proef.train");
open(OUTT49, ">${file}_49test.test");
open(OUTP49, ">${file}_49proef.train");

my($line);
my ($line_no);

$line_no = 0;

while ($line = <FILE>)
{
  chomp $line;
  $line_no ++;
  if ($line_no =~ m/[05]$/)
  {
    print OUTT05 "$line\n";
  }
  else
  {
    print OUTP05 "$line\n";
  }
  
  if ($line_no =~ m/[16]$/)
  {
    print OUTT16 "$line\n";
  }
  else
  {
    print OUTP16 "$line\n";
  }
  
  if ($line_no =~ m/[27]$/)
  {
    print OUTT27 "$line\n";
  }
  else
  {
    print OUTP27 "$line\n";
  }  
  
  if ($line_no =~ m/[38]$/)
  {
    print OUTT38 "$line\n";
  }
  else
  {
    print OUTP38 "$line\n";
  } 
  
  if ($line_no =~ m/[49]$/)
  {
    print OUTT49 "$line\n";
  }
  else
  {
    print OUTP49 "$line\n";
  } 
}
}
