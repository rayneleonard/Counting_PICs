#!/usr/bin/perl 
#using perl version 5.18.2


#writing a program that will count subs in a fasta or txt alignment file

#in this program, I will treat each input[1], input[3], and so on 
#and put them into an array together to be parsed. 

#this program will use a multiple alignment with 10 sequences aligned in fasta format
#the first sequence is used as the reference

#note that this only counts SNPs, not insertions/deletions. 

#open gene input file; needs to be in FASTA format
#pull in from command line
open(INPUT, "$ARGV[0]") || die "Can't find input file, try again; $!n";
#open output file
open (OUTPUT, '>output_10x.txt') || die "can't open output;$!n";
#label output file
print OUTPUT "\t\t\tbp\t\tposition\n";

#put into array;
@input = <INPUT>;

#assigning vars

$counter = 0;

$count_sub = 0;



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
$query8_name = $input[14];
$query8= $input[15];
$query9_name = $input[16];
$query9 = $input[17];
$query10_name = $input[18];
$query10 = $input[19];

#chomp and clear out invisible characters here 
chomp $query1;
chomp $query2;
chomp $query3;
chomp $query4;
chomp $query5;
chomp $query6;
chomp $query7;
chomp $query8;
chomp $query9;
chomp $query10;

$query1 =~ s/[^\w-]//g;
$query2 =~ s/[^\w-]//g;
$query3 =~ s/[^\w-]//g;
$query4 =~ s/[^\w-]//g;
$query5 =~ s/[^\w-]//g;
$query6 =~ s/[^\w-]//g;
$query7 =~ s/[^\w-]//g;
$query8 =~ s/[^\w-]//g;
$query9 =~ s/[^\w-]//g;
$query10 =~ s/[^\w-]//g;

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
@query8 = split ('', $query8);
@query9 = split ('', $query9);
@query10 = split ('', $query10);
# 
# print "@refseq\n\n\n@queryseq"; 
$length1 = scalar @query1;


#print "$query1\n$query2\n"; that printed as it should have


while ($counter <= $length1)
{
	$query1nt = $query1[$counter];
	#counter is how many things in arrays
	$query2nt = $query2[$counter];
	$query3nt = $query3[$counter];

	$query4nt = $query4[$counter];
	$query5nt = $query5[$counter];
	$query6nt = $query6[$counter];
	$query7nt = $query7[$counter];

	$query8nt = $query8[$counter];
	$query9nt = $query9[$counter];
	$query10nt = $query10[$counter];


	
	if ($query1nt ne $query2nt && $query1nt ne "-" && $query2nt ne "-")
	{
		++$count_sub;
		print OUTPUT "SNP 1,2 \t$query1nt\t$query2nt\t$counter\n";
 	}
	elsif ($query1nt ne $query3nt && $query1nt ne "-" && $query3nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,3 \t$query1nt\t$query3nt\t$counter\n";

	}
	elsif ($query1nt ne $query4nt && $query1nt ne "-" && $query4nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,4 \t$query1nt\t$query4nt\t$counter\n";

	}
	elsif ($query1nt ne $query5nt && $query1nt ne "-" && $query5nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,5 \t$query1nt\t$query5nt\t$counter\n";

 	}
	elsif ($query1nt ne $query6nt && $query1nt ne "-" && $query6nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,6 \t$query1nt\t$query6nt\t$counter\n";

	}
	elsif ($query1nt ne $query7nt && $query1nt ne "-" && $query7nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,7 \t$query1nt\t$query7nt\t$counter\n";

	}
	elsif ($query1nt ne $query8nt && $query1nt ne "-" && $query8nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,8 \t$query1nt\t$query8nt\t$counter\n";

	}
	elsif ($query1nt ne $query9nt && $query1nt ne "-" && $query9nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,9 \t$query1nt\t$query9nt\t$counter\n";

	}
	elsif ($query1nt ne $query10nt && $query1nt ne "-" && $query10nt ne "-")
	{
		++$count_sub;
				print OUTPUT "SNP 1,10 \t$query1nt\t$query10nt\t$counter\n";

	}
	else
	{
		++$count_same;
	}	
		
++$counter;
		
}
$totallength = $count_sub + $count_same - 1;

print "The number of SNPs in alignment is $count_sub.\n\n";

print "The alignment length is $length1 base pairs.\n\n";

exit;

#test file 10x_example.fasta length: 63bp
#test file SNPs: 6
