#!/usr/bin/perl 
#using perl version 5.18.2

#writing a program that will count subs in a fasta or txt alignment file

#in this program, I will treat each input[1], input[3], and so on 
#and put them into an array together to be parsed. 

#this program will use a multiple alignment with 3 sequences aligned in fasta format
#the first sequence is used as the reference
#can be easily edited for more sequences in alignment; see 10x program

#note that this only counts SNPs, not insertions/deletions. 

#open gene input file; needs to be in FASTA format
#pull in from command line
open(INPUT, "$ARGV[0]") || die "Can't find input file, try again; $!n";
#open output
open (OUTPUT, '>output_3x.txt') || die "can't open output;$!n";

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
#can add as many as necessary as follows:
# $query4_name = $input[6];
# $query4 = $input[7];

#chomp and clear out invisible characters here 
chomp $query1;
chomp $query2;
chomp $query3;

$query1 =~ s/[^\w-]//g;
$query2 =~ s/[^\w-]//g;
$query3 =~ s/[^\w-]//g;


#print "$refseq_name \n $query_name \n"; success. 

#1 and 3 need to be vars to start with then split on '', not in loop. 
#this explodes the strings. Already single strings. 

@query1 = split ('', $query1);
@query2 = split ('', $query2); 
@query3 = split ('', $query3);


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
	else
	{
		++$count_same;
	}	
		
++$counter;
	#print OUTPUT "SNP\t\t\t$counter\t$refseqnt\t$queryseqnt\n";	
}
$totallength = $count_sub + $count_same -1;

print "The number of subs is $count_sub. \n\n";

print "$totallength should equal the length of the alignment, $length1.\n\n";

exit;

#example file 3x_example.fasta length: 63bp
#example file SNPs: 3