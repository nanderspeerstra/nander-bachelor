use strict;

#pak alle bestanden
my @files = <D:/data_ng1/*.svmvec>;
my $count = @files;

#variabelen
my (@array,@sentence);
my ($number,$file,$line);
my ($feature,$value,$p,$pos);
my (@f_nummer, $q, $x, $y);

#maak een array met evenveel regels als er verschillende features zijn
for ($p=0;$p<=47188;$p++)
{
    $sentence[$p] = $p;
}

#test op X auteurs ipv op 600
my ($n);
$n = 0;

foreach $file (@files)
{
#pak eerste X auteurs
  $n++;
  if ($n == 10)
  {
    last;
  }
 
  @array = [];

#pak bestand  
  open(FILE, "$file");
  
#print auteur
  print "$file\n";
  while ($line = <FILE>)
  {
    $line =~ s/^ (.*)/$1/;
    chomp ($line);
    
#maak array met [feature_no:waarde]
    @array = split(/\s+/,$line);
	
	for ($q=0;$q<=$#array;$q++)
	{

#splits features en waarden   
	  ($x,$y) = split(/:/,$array[$q]);
	  $f_nummer[$x] = $y;
	}
	
	
	for ($p=0;$p<=$#sentence;$p++)
    {

   
      
      if (exists ($f_nummer[$p]))
      {      
		$sentence[$p] = $sentence[$p]."	$f_nummer[$p]";
      }
      
	  else
	  {
	    $sentence[$p] = $sentence[$p]."	0";
      }
    }
  }  
}

#print naar bestand
open(UITVOER, ">data_ng1_test.txt");
for ($pos=0;$pos<=$#sentence;$pos++)
{
  
    print UITVOER "$sentence[$pos]\n";
  
}
close(UITVOER);