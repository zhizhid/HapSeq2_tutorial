
$sample_list = shift;
$bam_dir = shift;
$range = shift;
$target_dir = shift;

die "Usage: $0 sample_list bam_dir range target_dir\n" unless $target_dir;


$i=0;
open(FI, $sample_list);
while(<FI>)
{
	chomp;
	$i ++;
	&run ( "samtools view -b $bam_dir/$_.bam $range -o $target_dir/$_.bam; samtools index $target_dir/$_.bam");
}
close FI;



sub run
{
    $_ = shift;
    print $_, "\n";
    system $_;
}



