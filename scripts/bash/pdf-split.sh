#!/usr/bin/perl -w 

# This script takes an OpenOffice Impress output file in PDF format, 
# including both slides and notes, and splits that PDF into separate 
# slides-only and notes-only PDF files.  The reason this script exists 
# is because OpenOffice itself (as of version 2.2, at least) does not 
# have the capability to export a notes-only PDF file. 
# 
# This script depends on the pdftk program (http://www.pdfhacks.com/pdftk/) 
# being installed and available in your command search path. 

if (scalar @ARGV != 1) { 
    print "usage:  split_pdf slides_and_notes.pdf\n"; 
    exit 1; 
} 

my $pdf_file = $ARGV[0]; 

# An OpenOffice Impress PDF contains a certain string that holds the 
# total number of pages in the document.  There may be no guarantee 
# that this string must exist, but since it does for now, we use it. 
my $pagecountstring = `strings $pdf_file | fgrep /Count`; 
$pagecountstring =~ m,/Count (\d+)>>,; 
my $totalpagecount = $1; 
my $halfpagecount = $totalpagecount / 2; 
my $firstnotepage = $halfpagecount + 1; 

my $out_file_base = $pdf_file; 
$out_file_base =~ s/\.pdf$//; 

`pdftk $pdf_file cat              1-$halfpagecount  output ${out_file_base}_slides.pdf`; 
`pdftk $pdf_file cat $firstnotepage-$totalpagecount output ${out_file_base}_notes.pdf`;