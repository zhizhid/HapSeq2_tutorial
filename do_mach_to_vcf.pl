
foreach(<*.qc>)
  {
    if (/CEU/) {$pop = 'CEU';}
    if (/YRI/) {$pop = 'YRI';}

    if (/(.*)\.qc/)
      {
	$file = $1;
      }

    &run ("perl ~/Works/HapSeq/pl/mach_to_vcf_phased.pl -m $file -s $pop.sites.txt -i ../$pop.sample.ID.txt > $file.vcf" );
    $first = `cat $pop.sites.txt | head -n 1 | cut -f 1`;
    chomp $first;
    $last = `cat $pop.sites.txt | tail -n 1 | cut -f 1`;
    chomp $last;
    &run ("vcftools --gzvcf ../../Omni/ALL.chr20.omni_2123_samples_b37_SHAPEIT.20120103.snps.chip_based.haplotypes.vcf.gz --recode --chr 20 --from-bp $first --to-bp $last --out this");
    &run("vcftools --vcf $file.vcf --diff this.recode.vcf --diff-discordance-matrix --diff-switch-error --out $file");

  }

sub run
{
  $cmd = shift;
  print $cmd, "\n";
  system $cmd;

}
