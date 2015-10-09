
$sample_list = shift;
$bam_dir = shift;
$vcf = shift;
$target_dir = shift;

die "Usage: $0 sample_list bam_dir vcf_file target_dir\n" unless $target_dir;


$i=0;
open(FI, $sample_list);
while(<FI>)
{
	chomp;
	$i ++;
	$id = $_;
	&run ( "./bam_parser $bam_dir/$id.bam $vcf $target_dir/$id $i");
	&run ( "./bam_parser $bam_dir/$id.bam $vcf $target_dir/$id $i 1");
}
close FI;



sub run
{
    $_ = shift;
    print $_, "\n";
    system $_;
}



