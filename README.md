# Counting_PICs

parsing DNA alignments for PICs

PICs: potentially informative characters,
  includes indels and SNPs

Useful for screening genetic data for potentially phylogenetically informative markers

For example of such a screening process and its uses, and more details about PICs, see:

  Shaw, Joey, Hayden L. Shafer, O. Rayne Leonard, Margaret J. Kovach, Mark Schorr, and Ashley B. Morris. 2014. 
  Chloroplast DNA sequence utility for the lowest phylogenetic and phylogeographic inferences in angiosperms: 
  tortoise and hare IV. American Journal of Botany 101(11):1-17. 

run from command line with perl

counting_program_2x.pl
  input: pairwise alignment in fasta format
  output: txt file with type of PIC (insertion, deletion, SNP), base pair difference (if SNP) and location
  
counting_subs_3x.pl
  input: multiple alignment with 3 sequences in fasta format
  output: txt file with SNP base pair differences and locations

counting_subs_10x.pl
  same as 3x; is included to demonstrate that programs that are used only for counting SNPs
  are easily edited to accomodate any number of sequences
  
Examples of input and output files are included

Updates will come periodically. Will add ability to report length of indels in 2x alignments, 
and indel reporting in multiple alignments. 

