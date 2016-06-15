package genome_transform::genome_transformImpl;
use strict;
use Bio::KBase::Exceptions;
# Use Semantic Versioning (2.0.0-rc.1)
# http://semver.org
our $VERSION = "0.1.0";

=head1 NAME

genome_transform

=head1 DESCRIPTION

A KBase module: genome_transform
This sample module contains one small method - filter_contigs.

=cut

#BEGIN_HEADER
use Bio::KBase::AuthToken;
use Bio::KBase::workspace::Client;
use Config::IniFiles;
use Data::Dumper;
use JSON;
binmode STDOUT, ":utf8";
#END_HEADER

sub new
{
    my($class, @args) = @_;
    my $self = {
    };
    bless $self, $class;
    #BEGIN_CONSTRUCTOR

    my $config_file = $ENV{ KB_DEPLOYMENT_CONFIG };
    my $cfg = Config::IniFiles->new(-file=>$config_file);
    my $wsInstance = $cfg->val('genome_transform','workspace-url');
    die "no workspace-url defined" unless $wsInstance;

    $self->{'workspace-url'} = $wsInstance;

    #END_CONSTRUCTOR

    if ($self->can('_init_instance'))
    {
	$self->_init_instance();
    }
    return $self;
}

=head1 METHODS



=head2 genbank_to_genome

  $return = $obj->genbank_to_genome($genbank_to_genome_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$genbank_to_genome_params is a genome_transform.genbank_to_genome_params
$return is a genome_transform.object_id
genbank_to_genome_params is a reference to a hash where the following keys are defined:
	genbank_shock_ref has a value which is a genome_transform.shock_ref
	genbank_file_path has a value which is a genome_transform.file_path
	workspace has a value which is a genome_transform.workspace_id
	genome_id has a value which is a genome_transform.object_id
	contigset_id has a value which is a genome_transform.object_id
shock_ref is a string
file_path is a string
workspace_id is a string
object_id is a string

</pre>

=end html

=begin text

$genbank_to_genome_params is a genome_transform.genbank_to_genome_params
$return is a genome_transform.object_id
genbank_to_genome_params is a reference to a hash where the following keys are defined:
	genbank_shock_ref has a value which is a genome_transform.shock_ref
	genbank_file_path has a value which is a genome_transform.file_path
	workspace has a value which is a genome_transform.workspace_id
	genome_id has a value which is a genome_transform.object_id
	contigset_id has a value which is a genome_transform.object_id
shock_ref is a string
file_path is a string
workspace_id is a string
object_id is a string


=end text



=item Description



=back

=cut

sub genbank_to_genome
{
    my $self = shift;
    my($genbank_to_genome_params) = @_;

    my @_bad_arguments;
    (ref($genbank_to_genome_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"genbank_to_genome_params\" (value was \"$genbank_to_genome_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to genbank_to_genome:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'genbank_to_genome');
    }

    my $ctx = $genome_transform::genome_transformServer::CallContext;
    my($return);
    #BEGIN genbank_to_genome

    print $genbank_to_genome_params->{genbank_file_path};
    print &Dumper ($genbank_to_genome_params);

    my $file_path = $genbank_to_genome_params->{genbank_file_path};
    my $workspace = $genbank_to_genome_params->{workspace};
    my $genome_id = $genbank_to_genome_params->{genome_id};
    my $contig_id = $genbank_to_genome_params->{contigset_id};

    $genome_id = $genome_id."";

    my $relative_fp = "/data/bulktest/data/bulktest/".$file_path;

    print "complete-file-path  $file_path\n relative-file-path $relative_fp\n\n";

################################
#system ('/kb/deployment/bin/trns_transform_Genbank_Genome_to_KBaseGenomes_Genome  --shock_service_url  https://ci.kbase.us/services/shock-api --workspace_service_url http://ci.kbase.us/services/ws --workspace_name  "janakakbase:1455821214132" --object_name NC_003197 --contigset_object_name  ContigNC_003197 --input_directory /kb/module/data/NC_003197.gbk --working_directory /kb/module/workdir/tmp/Genomes');
#system ('/kb/deployment/bin/trns_transform_Genbank_Genome_to_KBaseGenomes_Genome  --shock_service_url  https://ci.kbase.us/services/shock-api --workspace_service_url https://appdev.kbase.us/services/ws --workspace_name  "janakakbase:1464032798535" --object_name NC_003197 --contigset_object_name  ContigNC_003197 --input_directory /kb/module/data/NC_003197.gbk --working_directory /kb/module/workdir/tmp/Genomes');
system ("ls /data/");
system ("/kb/deployment/bin/trns_transform_Genbank_Genome_to_KBaseGenomes_Genome  --shock_service_url  https://ci.kbase.us/services/shock-api --workspace_service_url https://appdev.kbase.us/services/ws --workspace_name $workspace  --object_name $genome_id   --contigset_object_name  $contig_id --input_directory $file_path  --working_directory /kb/module/work/tmp/Genomes");

#################################

    #$return = {'file path input hash' => $genome_id};
    $return = $genome_id;

    #END genbank_to_genome
    my @_bad_returns;
    (!ref($return)) or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to genbank_to_genome:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'genbank_to_genome');
    }
    return($return);
}




=head2 fasta_to_contig

  $return = $obj->fasta_to_contig($fasta_to_contig_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$fasta_to_contig_params is a genome_transform.fasta_to_contig_params
$return is a genome_transform.object_id
fasta_to_contig_params is a reference to a hash where the following keys are defined:
	fasta_shock_ref has a value which is a genome_transform.shock_ref
	fasta_file_path has a value which is a genome_transform.file_path
	workspace has a value which is a genome_transform.workspace_id
	genome_id has a value which is a genome_transform.object_id
	contigset_id has a value which is a genome_transform.object_id
shock_ref is a string
file_path is a string
workspace_id is a string
object_id is a string

</pre>

=end html

=begin text

$fasta_to_contig_params is a genome_transform.fasta_to_contig_params
$return is a genome_transform.object_id
fasta_to_contig_params is a reference to a hash where the following keys are defined:
	fasta_shock_ref has a value which is a genome_transform.shock_ref
	fasta_file_path has a value which is a genome_transform.file_path
	workspace has a value which is a genome_transform.workspace_id
	genome_id has a value which is a genome_transform.object_id
	contigset_id has a value which is a genome_transform.object_id
shock_ref is a string
file_path is a string
workspace_id is a string
object_id is a string


=end text



=item Description



=back

=cut

sub fasta_to_contig
{
    my $self = shift;
    my($fasta_to_contig_params) = @_;

    my @_bad_arguments;
    (ref($fasta_to_contig_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"fasta_to_contig_params\" (value was \"$fasta_to_contig_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to fasta_to_contig:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'fasta_to_contig');
    }

    my $ctx = $genome_transform::genome_transformServer::CallContext;
    my($return);
    #BEGIN fasta_to_contig
     my $token=$ctx->token;
    my $provenance=$ctx->provenance;
    my $wsClient=Bio::KBase::workspace::Client->new($self->{'workspace-url'},token=>$token);

    my $file_path = $fasta_to_contig_params->{fasta_file_path};
    my $workspace = $fasta_to_contig_params->{workspace};
    my $genome_id = $fasta_to_contig_params->{genome_id};
    my $contig_id = $fasta_to_contig_params->{contigset_id};
     print &Dumper ($fasta_to_contig_params);

    #$contig_id = $contig_id."";

    my $relative_fp = "/data/bulktest/data/bulktest/".$file_path;

    print "complete-file-path  $file_path\n relative-file-path $relative_fp\n\n";

################################
#system ('/kb/deployment/bin/trns_transform_Genbank_Genome_to_KBaseGenomes_Genome  --shock_service_url  https://ci.kbase.us/services/shock-api --workspace_service_url http://ci.kbase.us/services/ws --workspace_name  "janakakbase:1455821214132" --object_name NC_003197 --contigset_object_name  ContigNC_003197 --input_directory /kb/module/data/NC_003197.gbk --working_directory /kb/module/workdir/tmp/Genomes');
#system ('/kb/deployment/bin/trns_transform_Genbank_Genome_to_KBaseGenomes_Genome  --shock_service_url  https://ci.kbase.us/services/shock-api --workspace_service_url https://appdev.kbase.us/services/ws --workspace_name  "janakakbase:1464032798535" --object_name NC_003197 --contigset_object_name  ContigNC_003197 --input_directory /kb/module/data/NC_003197.gbk --working_directory /kb/module/workdir/tmp/Genomes');

system ("/kb/deployment/bin/trns_transform_FASTA_DNA_Assembly_to_KBaseGenomes_ContigSet  --shock_service_url  https://ci.kbase.us/services/shock-api   --output_file_name $contig_id  --input_directory $file_path  --working_directory /kb/module/work/tmp/Genomes");

#################################

my $json;
{
  local $/; #Enable 'slurp' mode
  open my $fh, "<", "/kb/module/work/tmp/Genomes/$contig_id";
  $json = <$fh>;
  close $fh;
}
#print &Dumper ($json);
#die;

my $contig_set = decode_json($json);


    my $obj_info_list = undef;
        eval {
            $obj_info_list = $wsClient->save_objects({
                'workspace'=>$workspace,
                'objects'=>[{
                'type'=>'KBaseGenomes.ContigSet',
                'data'=>$contig_set,
                'name'=>$genome_id,
                'provenance'=>$provenance

            }]
        });
    };
    if ($@) {
        die "Error saving modified genome object to workspace:\n".$@;
    }

    #$return = {'file path input hash' => $genome_id};

    $return = $genome_id;


    #END fasta_to_contig
    my @_bad_returns;
    (!ref($return)) or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to fasta_to_contig:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'fasta_to_contig');
    }
    return($return);
}




=head2 tsv_to_exp

  $return = $obj->tsv_to_exp($tsv_to_exp_params)

=over 4

=item Parameter and return types

=begin html

<pre>
$tsv_to_exp_params is a genome_transform.tsv_to_exp_params
$return is a genome_transform.object_id
tsv_to_exp_params is a reference to a hash where the following keys are defined:
	tsvexp_shock_ref has a value which is a genome_transform.shock_ref
	tsvexp_file_path has a value which is a genome_transform.file_path
	workspace has a value which is a genome_transform.workspace_id
	genome_id has a value which is a genome_transform.object_id
	expMaxId has a value which is a genome_transform.object_id
shock_ref is a string
file_path is a string
workspace_id is a string
object_id is a string

</pre>

=end html

=begin text

$tsv_to_exp_params is a genome_transform.tsv_to_exp_params
$return is a genome_transform.object_id
tsv_to_exp_params is a reference to a hash where the following keys are defined:
	tsvexp_shock_ref has a value which is a genome_transform.shock_ref
	tsvexp_file_path has a value which is a genome_transform.file_path
	workspace has a value which is a genome_transform.workspace_id
	genome_id has a value which is a genome_transform.object_id
	expMaxId has a value which is a genome_transform.object_id
shock_ref is a string
file_path is a string
workspace_id is a string
object_id is a string


=end text



=item Description



=back

=cut

sub tsv_to_exp
{
    my $self = shift;
    my($tsv_to_exp_params) = @_;

    my @_bad_arguments;
    (ref($tsv_to_exp_params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"tsv_to_exp_params\" (value was \"$tsv_to_exp_params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to tsv_to_exp:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'tsv_to_exp');
    }

    my $ctx = $genome_transform::genome_transformServer::CallContext;
    my($return);
    #BEGIN tsv_to_exp
    my $token=$ctx->token;
    my $provenance=$ctx->provenance;
    my $wsClient=Bio::KBase::workspace::Client->new($self->{'workspace-url'},token=>$token);

    my $file_path = $tsv_to_exp_params->{tsvexp_file_path};
    my $workspace = $tsv_to_exp_params->{workspace};
    my $genome_id = $tsv_to_exp_params->{genome_id};
    my $exp_id = $tsv_to_exp_params->{expMaxId};
    print &Dumper ($tsv_to_exp_params);

    my $relative_fp = "/data/bulktest/data/bulktest/".$file_path;

    print "complete-file-path  $file_path\n relative-file-path $relative_fp\n\n";

################################
#system ('/kb/deployment/bin/trns_transform_Genbank_Genome_to_KBaseGenomes_Genome  --shock_service_url  https://ci.kbase.us/services/shock-api --workspace_service_url http://ci.kbase.us/services/ws --workspace_name  "janakakbase:1455821214132" --object_name NC_003197 --contigset_object_name  ContigNC_003197 --input_directory /kb/module/data/NC_003197.gbk --working_directory /kb/module/workdir/tmp/Genomes');
#system ('/kb/deployment/bin/trns_transform_Genbank_Genome_to_KBaseGenomes_Genome  --shock_service_url  https://ci.kbase.us/services/shock-api --workspace_service_url https://appdev.kbase.us/services/ws --workspace_name  "janakakbase:1464032798535" --object_name NC_003197 --contigset_object_name  ContigNC_003197 --input_directory /kb/module/data/NC_003197.gbk --working_directory /kb/module/workdir/tmp/Genomes');
system ("/kb/deployment/bin/trns_transform_TSV_Exspression_to_KBaseFeatureValues_ExpressionMatrix  --workspace_service_url https://appdev.kbase.us/services/ws  --workspace_name $workspace  --object_name $genome_id   --output_file_name  $exp_id --input_directory $file_path  --working_directory /kb/module/work/tmp/Genomes");

#################################


my $json;

{
  local $/; #Enable 'slurp' mode
  open my $fh, "<", "/kb/module/work/tmp/Genomes/$exp_id";
  $json = <$fh>;
  close $fh;
}

my $exp_ob = decode_json($json);
    #print &Dumper ($exp_ob);

    my $obj_info_list = undef;
        eval {
            $obj_info_list = $wsClient->save_objects({
                'workspace'=>$workspace,
                'objects'=>[{
                'type'=>'KBaseFeatureValues.ExpressionMatrix',
                'data'=>$exp_ob,
                'name'=>$genome_id,
                'provenance'=>$provenance
                }]
            });
        };
    if ($@) {
        die "Error saving modified genome object to workspace:\n".$@;
    }
     print &Dumper ($obj_info_list);
    return $exp_id;
    #END tsv_to_exp
    my @_bad_returns;
    (!ref($return)) or push(@_bad_returns, "Invalid type for return variable \"return\" (value was \"$return\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to tsv_to_exp:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'tsv_to_exp');
    }
    return($return);
}




=head2 version

  $return = $obj->version()

=over 4

=item Parameter and return types

=begin html

<pre>
$return is a string
</pre>

=end html

=begin text

$return is a string

=end text

=item Description

Return the module version. This is a Semantic Versioning number.

=back

=cut

sub version {
    return $VERSION;
}

=head1 TYPES



=head2 shock_ref

=over 4



=item Description

URL to a shock node containing a data file for upload


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 file_path

=over 4



=item Description

Path to a file containing a data file for upload on the local filesystem


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 file_type

=over 4



=item Description

Type to a file containing a data file for upload on the local filesystem


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 object_id

=over 4



=item Description

Name of an object in the KBase workspace


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 report_id

=over 4



=item Description

Name of an report id


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 workspace_id

=over 4



=item Description

Name of a KBase workspace


=item Definition

=begin html

<pre>
a string
</pre>

=end html

=begin text

a string

=end text

=back



=head2 genbank_to_genome_params

=over 4



=item Description

Input parameters for the "genbank_to_genome" function.

        shock_ref genbank_shock_ref - optional URL to genbank file stored in Shock
        file_path genbank_file_path - optional path to genbank file on local file system
        workspace_id workspace - workspace where object will be saved
        object_id genome_id - workspace ID to which the genome object should be saved
        object_id contigset_id - workspace ID to which the contigs should be saved


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
genbank_shock_ref has a value which is a genome_transform.shock_ref
genbank_file_path has a value which is a genome_transform.file_path
workspace has a value which is a genome_transform.workspace_id
genome_id has a value which is a genome_transform.object_id
contigset_id has a value which is a genome_transform.object_id

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
genbank_shock_ref has a value which is a genome_transform.shock_ref
genbank_file_path has a value which is a genome_transform.file_path
workspace has a value which is a genome_transform.workspace_id
genome_id has a value which is a genome_transform.object_id
contigset_id has a value which is a genome_transform.object_id


=end text

=back



=head2 fasta_to_contig_params

=over 4



=item Description

Input parameters for the "fasta_to_contig" function.

        shock_ref shock_ref - optional URL to fasta file stored in Shock
        file_path file_path - optional path to fasta file on local file system
        workspace_id workspace - workspace where object will be saved
        object_id genome_id - workspace ID to which the contigs object should be saved
        object_id contigset_id - workspace ID to which the contigs should be saved


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
fasta_shock_ref has a value which is a genome_transform.shock_ref
fasta_file_path has a value which is a genome_transform.file_path
workspace has a value which is a genome_transform.workspace_id
genome_id has a value which is a genome_transform.object_id
contigset_id has a value which is a genome_transform.object_id

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
fasta_shock_ref has a value which is a genome_transform.shock_ref
fasta_file_path has a value which is a genome_transform.file_path
workspace has a value which is a genome_transform.workspace_id
genome_id has a value which is a genome_transform.object_id
contigset_id has a value which is a genome_transform.object_id


=end text

=back



=head2 tsv_to_exp_params

=over 4



=item Description

Input parameters for the "exp tsv to exp matirx" function.

        shock_ref shock_ref - optional URL to genbank file stored in Shock
        file_path file_path - optional path to genbank file on local file system
        workspace_id workspace - workspace where object will be saved
        object_id genome_id - workspace ID to which the genome object should be saved
        object_id contigset_id - workspace ID to which the contigs should be saved


=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
tsvexp_shock_ref has a value which is a genome_transform.shock_ref
tsvexp_file_path has a value which is a genome_transform.file_path
workspace has a value which is a genome_transform.workspace_id
genome_id has a value which is a genome_transform.object_id
expMaxId has a value which is a genome_transform.object_id

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
tsvexp_shock_ref has a value which is a genome_transform.shock_ref
tsvexp_file_path has a value which is a genome_transform.file_path
workspace has a value which is a genome_transform.workspace_id
genome_id has a value which is a genome_transform.object_id
expMaxId has a value which is a genome_transform.object_id


=end text

=back



=cut

1;
