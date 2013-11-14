use strict;
use warnings;
use threads('yield', 'stack_size' => 64*4096, 'exit' => 'threads_only', 'stringify');

my @files = <*.train>;
my $count = @files;

sub timbl {
  my $id = shift;
  my $file = shift;
  my $proef = $file;
  $proef =~ s/(.*)proef.train/$1/;
  print("Proef op thread $id: $proef\n");
  system("timbl -w5 -f $file -t ${proef}test.test > ${proef}output_w5.txt");
  system("timbl -w5 -mN -k2 -f $file -t ${proef}test.test -o ${proef}output_w5_mN_k2 > ${proef}score_w5_mN_k2.txt");
  system("timbl -w5 -mN -k3 -f $file -t ${proef}test.test -o ${proef}output_w5_mN_k3 > ${proef}score_w5_mN_k3.txt");
  system("timbl -w5 -mN -k4 -f $file -t ${proef}test.test -o ${proef}output_w5_mN_k4 > ${proef}score_w5_mN_k4.txt");
  system("timbl -w5 -mN -k5 -f $file -t ${proef}test.test -o ${proef}output_w5_mN_k5 > ${proef}score_w5_mN_k5.txt");
}

my @threads;
my $thread_id = 0;
foreach my $proef (@files) {
	push(@threads, threads->create('timbl', $thread_id++, $proef));
}

foreach my $thread (@threads) {
	$thread->join();
}

