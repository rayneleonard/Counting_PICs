#!/usr/bin/perl 
#perl version 5.18.2


#writing a program that will count subs and indels in a fasta or txt alignment file
#utilizes pairwise alignment

#printing length of indel to output file will be included in an update

#open gene input file
open(INPUT, "$ARGV[0]") || die "Can't find fasta file, try again; $!n";
#can make this go through all files in a directory 
open (OUTPUT, '>output_2x.txt') || die "can't open output;$!n";

print OUTPUT "Type\t\tbp\t\tposition\n";

#put into array;
@input = <INPUT>;


#assigning vars
$refseqnt = 0;
$counter = 0;
$queryseqnt = 0;
$insert_length = 0;
$delete_length = 0;


$refseq_name = $input[0];
$refseq = $input[1];
$query_name = $input[2];
$queryseq = $input[3];

#chomp and clear out invisible characters here 
chomp $refseq_name;
chomp $refseq;
chomp $query_name;
chomp $queryseq;


#1 and 3 need to be vars to start with then split on '', not in loop. 
#this explodes the strings. Already single strings. 

@refseq = split('', $refseq);
@queryseq = split ('', $queryseq); 
# 
# print "@refseq\n\n\n@queryseq"; 
$lengtharray = scalar @refseq;


while ($counter <= $lengtharray)
{
	$refseqnt = $refseq[$counter];
	#counter is how many things in arrays
	$queryseqnt = $queryseq[$counter];
	
	
	if ($refseqnt ne $queryseqnt)
	{
		if ($refseqnt eq "-") 
		{
# 		$prior_insert = $refseqnt;
			if ($prior_insert eq "-")
			{
			++$insert_length;
			#print "Hello";
			}
# 		++$insert_length;
		
			else #prior_insert !eq -
			{
			$insert_location= $counter - $insert_length;
			print OUTPUT "Insertion\t\t\t$insert_location\n";
			$insert_length = 0;
			++$count_up_insertion;
			
			}
		}
	
		if ($queryseqnt eq "-")
		{
			if ($prior_delete eq "-")
			{
			++$delete_length;
			#print "Hello again";
			}
			else
			{
			$delete_location = $counter - $delete_length;
			print OUTPUT "Deletion\t\t\t$delete_location\n";
			$delete_length = 0;
			++$count_up_deletion;
			} 
		}
		
		if ($refseqnt ne "-" && $queryseqnt ne "-") 
		{
		++$count_up_snp;
		print OUTPUT "SNP\t\t\t$refseqnt\t$queryseqnt\t$counter\n";
		}
	}
	$prior_insert = $refseqnt;
	$prior_delete = $queryseqnt;
	++$counter;
}
$indels = $count_up_insertion + $count_up_deletion;
$snp = $count_up_snp;

print "Total number of indels for $refseq_name is $indels and total number of SNPs is $snp\n\n";
print "Total length of array is $lengtharray\n";

#example file 2x_example.fasta length 63 bp
#indels 1
#SNPs 3


 
 