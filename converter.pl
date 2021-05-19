use strict;
use warnings;
binmode STDIN;
binmode STDOUT;
my $text;
while(<>){
	$text .= $_;
}
my $header = substr $text, 0, 79;
$text = substr $text, 80;
my $numberOfTriangles = unpack "L", $text;
print STDERR "There are $numberOfTriangles triangles.\n";
$text = substr $text, 4;
print "solid name\n";
for(my $i=0;$i<$numberOfTriangles;$i++){
	my @triangle = unpack "f12", $text;
	printf "facet normal %f %f %f\n", $triangle[0], $triangle[1], $triangle[2];
	print "    outer loop\n";
	printf "        vertex %f %f %f\n", $triangle[3], $triangle[4], $triangle[5];
	printf "        vertex %f %f %f\n", $triangle[6], $triangle[7], $triangle[8];
	printf "        vertex %f %f %f\n", $triangle[9], $triangle[10], $triangle[11];
	print "    endloop\n";
	print "endfacet\n";
	$text = substr $text, 50;
}
print "endsolid name\n";