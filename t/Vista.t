# -*-Perl-*-
## Bioperl Test Harness Script for Modules

use strict;
BEGIN {
    eval { require Test; };
    if( $@ ) {
        use lib 't';
    }
    use Test;
    use vars qw($NTESTS);
    $NTESTS = 4;
    plan tests => $NTESTS;
}

use vars qw( $reason);
$reason = 'Unable to run Vista , java may not be installed';

END {
   foreach ( $Test::ntest..$NTESTS ) {
       skip($reason,1);
   }
#   unlink "t/data/vista.pdf";
}

use Bio::Tools::Run::Vista;
use Bio::AlignIO;

#Java and java version check
my $v;
if (-d "java") {
    print STDERR "You must have java to run vista\n";
    $reason = "Skipping because no java present to run vista ";
    exit(0);
}
my $output = `java -version 2>&1`;
open(PIPE,"java -version 2>&1 |");

while (<PIPE>) { 
    if (/Java\sVersion\:\s(\d+\.\d+)/) {
	$v = $1;
	last;
    }
    elsif (/java version\s.(\d+\.\d+)/) {
	$v = $1;
	last;
    }
    elsif (/java version\s\"(\d\.\d)"/) {
	 $v = $1;
        last;
    }
}
if ($v < 1.2) {
    print STDERR "You need at least version 1.2 of JDK to run vista\n";
    $reason = "Skipping due to old java version";
    exit(0);   
}   
open (PIPE ,'java Vista 2>&1 |');
while(<PIPE>){
  if(/NoClassDefFoundError/){
    print STDERR "Vista.jar is not your class path \n";
    exit(0);
  }
}
my $inputfilename= Bio::Root::IO->catfile("t","data","vista.cls");
my $gff_file = Bio::Root::IO->catfile("t","data","vista.gff");
my $aio = Bio::AlignIO->new(-file=>$inputfilename,-format=>'clustalw');
my $aln = $aio->next_aln;

my $out= Bio::Root::IO->catfile("t","data","vista.pdf");
my $vis = Bio::Tools::Run::Vista->new('outfile'=>$out,
                                        'annotation'=>$gff_file,
                                        'annotation_format'=>'GFF',
                                        'regmin'=>75,
                                        'regmax'=>100,
                                        'min'   => 50,
                                        'tickdist' => 2000,
                                        'window'=>40,
                                        'numwindows'=>4,
                                        'quiet'=>1);
ok $vis->isa('Bio::Tools::Run::Vista');
ok $vis->min, 50,
ok $vis->annotation, $gff_file;

$vis->run($aln,1);

if($@=~/NoClassDefFoundError/){
  print STDERR "Vista jar file not installed. Skipping";
  exit(0);
} 
ok -e $out;


