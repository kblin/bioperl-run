
=head1 NAME

Bio::Tools::Run::PiseApplication::tfscan

=head1 SYNOPSIS

=head1 DESCRIPTION

Bio::Tools::Run::PiseApplication::tfscan

      Bioperl class for:

	TFSCAN	Scans DNA sequences for transcription factors (EMBOSS)

      Parameters:


		tfscan (String)
			

		init (String)
			

		input (Paragraph)
			input Section

		sequence (Sequence)
			sequence -- DNA [sequences] (-sequence)
			pipe: seqsfile

		required (Paragraph)
			required Section

		menu (Excl)
			Select class -- Transcription Factor Class (-menu)

		mismatch (Integer)
			Number of mismatches (-mismatch)

		output (Paragraph)
			output Section

		outfile (OutFile)
			outfile (-outfile)

		auto (String)
			

=cut

#'
package Bio::Tools::Run::PiseApplication::tfscan;

use vars qw(@ISA);
use strict;
use Bio::Tools::Run::PiseApplication;

@ISA = qw(Bio::Tools::Run::PiseApplication);

=head2 new

 Title   : new()
 Usage   : my $tfscan = Bio::Tools::Run::PiseApplication::tfscan->new($remote, $email, @params);
 Function: Creates a Bio::Tools::Run::PiseApplication::tfscan object.
           This method should not be used directly, but rather by 
           a Bio::Factory::Pise instance:
           my $factory = Bio::Factory::Pise->new(-email => 'me@myhome');
           my $tfscan = $factory->program('tfscan');
 Example :
 Returns : An instance of Bio::Tools::Run::PiseApplication::tfscan.

=cut

sub new {
    my ($class, $remote, $email, @params) = @_;
    my $self = $class->SUPER::new($remote, $email);

# -- begin of definitions extracted from /local/gensoft/lib/Pise/5.a/PerlDef/tfscan.pm

    $self->{COMMAND}   = "tfscan";
    $self->{VERSION}   = "5.a";
    $self->{TITLE}   = "TFSCAN";

    $self->{DESCRIPTION}   = "Scans DNA sequences for transcription factors (EMBOSS)";

    $self->{CATEGORIES}   =  [  

         "nucleic:transcription",
  ];

    $self->{DOCLINK}   = "http://www.uk.embnet.org/Software/EMBOSS/Apps/tfscan.html";

    $self->{_INTERFACE_STANDOUT} = undef;
    $self->{_STANDOUT_FILE} = undef;

    $self->{TOP_PARAMETERS}  = [ 
	"tfscan",
	"init",
	"input",
	"required",
	"output",
	"auto",

    ];

    $self->{PARAMETERS_ORDER}  = [
	"tfscan",
	"init",
	"input", 	# input Section
	"sequence", 	# sequence -- DNA [sequences] (-sequence)
	"required", 	# required Section
	"menu", 	# Select class -- Transcription Factor Class (-menu)
	"mismatch", 	# Number of mismatches (-mismatch)
	"output", 	# output Section
	"outfile", 	# outfile (-outfile)
	"auto",

    ];

    $self->{TYPE}  = {
	"tfscan" => 'String',
	"init" => 'String',
	"input" => 'Paragraph',
	"sequence" => 'Sequence',
	"required" => 'Paragraph',
	"menu" => 'Excl',
	"mismatch" => 'Integer',
	"output" => 'Paragraph',
	"outfile" => 'OutFile',
	"auto" => 'String',

    };

    $self->{FORMAT}  = {
	"init" => {
		"perl" => ' "" ',
	},
	"input" => {
	},
	"sequence" => {
		"perl" => '" -sequence=$value -sformat=fasta"',
	},
	"required" => {
	},
	"menu" => {
		"perl" => '" -menu=$value"',
	},
	"mismatch" => {
		"perl" => '" -mismatch=$value"',
	},
	"output" => {
	},
	"outfile" => {
		"perl" => '" -outfile=$value"',
	},
	"auto" => {
		"perl" => '" -auto -stdout"',
	},
	"tfscan" => {
		"perl" => '"tfscan"',
	}

    };

    $self->{FILENAMES}  = {

    };

    $self->{SEQFMT}  = {
	"sequence" => [8],

    };

    $self->{GROUP}  = {
	"init" => -10,
	"sequence" => 1,
	"menu" => 2,
	"mismatch" => 3,
	"outfile" => 4,
	"auto" => 5,
	"tfscan" => 0

    };

    $self->{BY_GROUP_PARAMETERS}  = [
	"init",
	"input",
	"required",
	"output",
	"tfscan",
	"sequence",
	"menu",
	"mismatch",
	"outfile",
	"auto",

    ];

    $self->{SIZE}  = {

    };

    $self->{ISHIDDEN}  = {
	"init" => 1,
	"input" => 0,
	"sequence" => 0,
	"required" => 0,
	"menu" => 0,
	"mismatch" => 0,
	"output" => 0,
	"outfile" => 0,
	"auto" => 1,
	"tfscan" => 1

    };

    $self->{ISCOMMAND}  = {
	"init" => 0,
	"input" => 0,
	"sequence" => 0,
	"required" => 0,
	"menu" => 0,
	"mismatch" => 0,
	"output" => 0,
	"outfile" => 0,
	"auto" => 0,

    };

    $self->{ISMANDATORY}  = {
	"init" => 0,
	"input" => 0,
	"sequence" => 1,
	"required" => 0,
	"menu" => 1,
	"mismatch" => 1,
	"output" => 0,
	"outfile" => 1,
	"auto" => 0,

    };

    $self->{PROMPT}  = {
	"init" => "",
	"input" => "input Section",
	"sequence" => "sequence -- DNA [sequences] (-sequence)",
	"required" => "required Section",
	"menu" => "Select class -- Transcription Factor Class (-menu)",
	"mismatch" => "Number of mismatches (-mismatch)",
	"output" => "output Section",
	"outfile" => "outfile (-outfile)",
	"auto" => "",

    };

    $self->{ISSTANDOUT}  = {
	"init" => 0,
	"input" => 0,
	"sequence" => 0,
	"required" => 0,
	"menu" => 0,
	"mismatch" => 0,
	"output" => 0,
	"outfile" => 0,
	"auto" => 0,

    };

    $self->{VLIST}  = {

	"input" => ['sequence',],
	"required" => ['menu','mismatch',],
	"menu" => ['F','fungi','I','insect','P','plant','V','vertebrate','O','other',],
	"output" => ['outfile',],
    };

    $self->{FLIST}  = {

    };

    $self->{SEPARATOR}  = {

    };

    $self->{VDEF}  = {
	"menu" => 'V',
	"mismatch" => '0',
	"outfile" => 'outfile.out',

    };

    $self->{PRECOND}  = {
	"init" => { "perl" => '1' },
	"input" => { "perl" => '1' },
	"sequence" => { "perl" => '1' },
	"required" => { "perl" => '1' },
	"menu" => { "perl" => '1' },
	"mismatch" => { "perl" => '1' },
	"output" => { "perl" => '1' },
	"outfile" => { "perl" => '1' },
	"auto" => { "perl" => '1' },

    };

    $self->{CTRL}  = {

    };

    $self->{PIPEOUT}  = {

    };

    $self->{WITHPIPEOUT}  = {

    };

    $self->{PIPEIN}  = {
	"sequence" => {
		 "seqsfile" => '1',
	},

    };

    $self->{WITHPIPEIN}  = {

    };

    $self->{ISCLEAN}  = {
	"init" => 0,
	"input" => 0,
	"sequence" => 0,
	"required" => 0,
	"menu" => 0,
	"mismatch" => 0,
	"output" => 0,
	"outfile" => 0,
	"auto" => 0,

    };

    $self->{ISSIMPLE}  = {
	"init" => 0,
	"input" => 0,
	"sequence" => 1,
	"required" => 0,
	"menu" => 1,
	"mismatch" => 1,
	"output" => 0,
	"outfile" => 1,
	"auto" => 0,

    };

    $self->{PARAMFILE}  = {

    };

    $self->{COMMENT}  = {

    };

    $self->{SCALEMIN}  = {

    };

    $self->{SCALEMAX}  = {

    };

    $self->{SCALEINC}  = {

    };

    $self->{INFO}  = {

    };

# -- end of definitions extracted from /local/gensoft/lib/Pise/5.a/PerlDef/tfscan.pm



    $self->_init_params(@params);

    return $self;
}



1; # Needed to keep compiler happy
