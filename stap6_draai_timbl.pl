use strict;
use warnings;

my @files = <*.train>;
my $count = @files;

my ($test,$proef,$file);

foreach $proef (@files)
{
  $file = $proef;
  $proef =~ s/(.*)proef.train/$1/;
#  system("timbl -f $file -t ${proef}test.test > ${proef}output.txt");
  system("timbl -w5 -f $file -t ${proef}test.test > ${proef}output_w5.txt");
  
  system("timbl -w5 -mN -k2 -f $file -t ${proef}test.test -o ${proef}output_w5_mN_k2 > ${proef}score_w5_mN_k2.txt");
  system("timbl -w5 -mN -k3 -f $file -t ${proef}test.test -o ${proef}output_w5_mN_k3 > ${proef}score_w5_mN_k3.txt");
  system("timbl -w5 -mN -k4 -f $file -t ${proef}test.test -o ${proef}output_w5_mN_k4 > ${proef}score_w5_mN_k4.txt");
  system("timbl -w5 -mN -k5 -f $file -t ${proef}test.test -o ${proef}output_w5_mN_k5 > ${proef}score_w5_mN_k5.txt");
}

