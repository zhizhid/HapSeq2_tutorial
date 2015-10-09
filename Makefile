all: 
	mkdir HapSeq2_pipeline
	cp CEU.sample.ID.txt sites.vcf mach_to_vcf_phased.pl run_bam_parser.pl bam_parser hapseq2 Omni.recode.vcf Makefile HapSeq2_pipeline/
	mkdir HapSeq2_pipeline/BAMs
	cp -r BAMs/*.b* HapSeq2_pipeline/BAMs/
	tar zcf HapSeq2_pipeline.tgz HapSeq2_pipeline
	rm -fr HapSeq2_pipeline
