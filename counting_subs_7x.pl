#!/usr/bin/perl 

#writing a program that will count subs in a fasta or txt alignment file
#input: program_practice.fasta

#in this program, I will treat each input[1], input[3], and so on 
#and put them into an array together to be parsed. 

#that would mean I need a different program for 4x and 9x alignments. 


#open gene input file
open(INPUT, "$ARGV[0]") || die "Can't find input file, try again; $!n";
#can make this go through all files in a directory 
open (OUTPUT, '>output_subs_7.txt') || die "can't open output;$!n";


#put into array;
@input = <INPUT>;

#length of array
# $lengtharray = scalar @input; 
# $counter = 0;

#assigning vars
# $ref = 0;
$counter = 0;
# $queryseqnt = 0;
$count_sub = 0;
# $delete_length = 0;


$query1_name = $input[0];
$query1 = $input[1];
$query2_name = $input[2];
$query2 = $input[3];
$query3_name = $input[4];
$query3 = $input[5];
$query4_name = $input[6];
$query4 = $input[7];
$query5_name = $input[8];
$query5 = $input[9];
$query6_name = $input[10];
$query6 = $input[11];
$query7_name = $input[12];
$query7 = $input[13];
# $query8_name = $input[14];
# $query8= $input[15];
# $query9_name = $input[16];
# $query9 = $input[17];

#chomp and clear out invisible characters here 
chomp $query1;
chomp $query2;
chomp $query3;
chomp $query4;
chomp $query5;
chomp $query6;
chomp $query7;
# chomp $query8;
# chomp $query9;

$query1 =~ s/[^\w-]//g;
$query2 =~ s/[^\w-]//g;
$query3 =~ s/[^\w-]//g;
$query4 =~ s/[^\w-]//g;
$query5 =~ s/[^\w-]//g;
$query6 =~ s/[^\w-]//g;
$query7 =~ s/[^\w-]//g;
# $query8 =~ s/[^\w-]//g;
# $query9 =~ s/[^\w-]//g;

#print "$refseq_name \n $query_name \n"; success. 

#1 and 3 need to be vars to start with then split on '', not in loop. 
#this explodes the strings. Already single strings. 

@query1 = split ('', $query1);
@query2 = split ('', $query2); 
@query3 = split ('', $query3);
@query4 = split ('', $query4);
@query5 = split ('', $query5);
@query6 = split ('', $query6); 
@query7 = split ('', $query7);
# @query8 = split ('', $query8);
# @query9 = split ('', $query9);

# 
# print "@refseq\n\n\n@queryseq"; 
$length1 = scalar @query1;
# $length2 = scalar @query2;
# $length3 = scalar @query3;
# $length4 = scalar @query4;

#print "$query1\n$query2\n"; that printed as it should have

#going to stick to pairwise comparisons. q 

while ($counter <= $length1)
{
	$query1nt = $query1[$counter];
	#counter is how many things in arrays
	$query2nt = $query2[$counter];
	$query3nt = $query3[$counter];

	$query4nt = $query4[$counter];
	$query5nt = $query5[$counter];
	#counter is how many things in arrays
	$query6nt = $query6[$counter];
	$query7nt = $query7[$counter];

# 	$query8nt = $query8[$counter];
# 	$query9nt = $query9[$counter];


	
	
	if ($query1nt ne $query2nt && $query1nt ne "-" && $query2nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,2 \t$query1nt\t$query2nt\t$counter\n";

 	}
	elsif ($query1nt ne $query3nt && $query1nt ne "-" && $query3nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,3 \t$query1nt\t$query2nt\t$counter\n";

	}
	elsif ($query1nt ne $query4nt && $query1nt ne "-" && $query4nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,4 \t$query1nt\t$query2nt\t$counter\n";

	}
	elsif ($query1nt ne $query5nt && $query1nt ne "-" && $query5nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,5 \t$query1nt\t$query2nt\t$counter\n";

 	}
	elsif ($query1nt ne $query6nt && $query1nt ne "-" && $query6nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,6 \t$query1nt\t$query2nt\t$counter\n";

	}
	elsif ($query1nt ne $query7nt && $query1nt ne "-" && $query7nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,7 \t$query1nt\t$query2nt\t$counter\n";

	}
	# elsif ($query1nt ne $query8nt && $query1nt ne "-" && $query8nt ne "-")
# 	{
# 		++$count_sub;
# 	}
# 	elsif ($query1nt ne $query9nt && $query1nt ne "-" && $query9nt ne "-")
# 	{
# 		++$count_sub;
# 	}
	else
	{
		++$count_same;
	}	
		
++$counter;
	#print OUTPUT "SNP\t\t\t$counter\t$refseqnt\t$queryseqnt\n";	
}
$totallength = $count_sub + $count_same;

print "The number of subs is $count_sub. The number of matches is $count_same.\n\n";

print "To check yo'self, $totallength, the number of subs plus the number of matches,\n should equal the length of the alignment, $length1.\n\n";

exit;

