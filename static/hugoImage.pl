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

my $some_dir = $dir;
opendir(DIR, $some_dir) || die "can't opendir $some_dir: $!";
@files =
  sort {(stat "$some_dir/$a")[9] <=> (stat "$some_dir/$b")[9]}
  grep {  -f "$some_dir/$_" }
  readdir(DIR);
closedir DIR;
print join "\n", @files;

foreach(@files){
    if ($_ =~ /\.jpg/ | $_ =~ /\.png/) {
        print OUT "{{< image-resize \"$_\" \"1024x\" >}}\n";
    }
}
