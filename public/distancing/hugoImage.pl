#!/usr/bin/perl

use Cwd;
my $dir = getcwd;

if ($dir =~ /\/(.*)$/) {
    $inside = $1;
}

opendir(DIR, $dir);
my @files = readdir(DIR);
closedir(DIR);

open(OUT, ">post.md");

print OUT "---\n";
print OUT "title:  \"\"\n";
print OUT "header:\n";
print OUT "  image: $inside/.jpg\n";
print OUT "  teaser: $inside/.jpg\n";
print OUT "tags: \n";
print OUT "  - \n";
print OUT "  - \n";
print OUT "---\n\n";

foreach(@files){
    if ($_ =~ /\.jpg/ | $_ =~ /\.png/) {
        print OUT "{{< image-resize \"$_\" \"1024x\" >}}\n";
    }
}
