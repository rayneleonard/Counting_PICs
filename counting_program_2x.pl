#!/usr/bin/perl 

#writing a program that will count subs and indels in a fasta or txt alignment file
#input: program_practice.fasta

#open gene input file
open(INPUT, "$ARGV[0]") || die "Can't find fasta file, try again; $!n";
#can make this go through all files in a directory 
#open (OUTPUT, '>output.txt') || die "can't open output;$!n";


#put into array;
@input = <INPUT>;

#length of array
# $lengtharray = scalar @input; 
# $counter = 0;

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

#print "$refseq_name \n $query_name \n"; success. 

#1 and 3 need to be vars to start with then split on '', not in loop. 
#this explodes the strings. Already single strings. 

@refseq = split('', $refseq);
@queryseq = split ('', $queryseq); 
# 
# print "@refseq\n\n\n@queryseq"; 
$lengtharray = scalar @refseq;

#going to stick to pairwise comparisons. q 

while ($counter <= $lengtharray)
{
	$refseqnt = $refseq[$counter];
	#counter is how many things in arrays
	$queryseqnt = $queryseq[$counter];
	
	#if ($refseqnt eq $queryseqnt)
	#{
	#	++$count_up_same;
	#}
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
			print OUTPUT "Insertion\t$insert_location\t$insert_length\n";
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
			print OUTPUT "Deletion\t$delete_location\t$delete_length\n";
			$delete_length = 0;
			++$count_up_deletion;
			} 
		}
		
		if ($refseqnt ne "-" && $queryseqnt ne "-") 
		{
		++$count_up_snp;
		print OUTPUT "SNP\t\t\t$counter\t$refseqnt\t$queryseqnt\n";
		}
	}
	$prior_insert = $refseqnt;
	$prior_delete = $queryseqnt;
	++$counter;
}
$indels = $count_up_insertion + $count_up_deletion;
$snp = $count_up_snp - 1;

print "number of indels for $refseq_name is $indels and number of SNPs is $snp\n\n";
print "length of array is $lengtharray\n";


# print OUTPUT "this is awesomesauce.\n";
#  print OUTPUT "this accurately counts SNPs and number of indels as I want them coded.
#  Still doesn't give length of indels, but for now, this is great.\n";
#  print OUTPUT "note that the last character (106) is coded as SNP, though that is really the
#  end of the seq. not a big deal.\n";
#  
 
 