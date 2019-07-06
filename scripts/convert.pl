#!/usr/bin/perl
use warnings;
use strict;
use File::Basename;
use POSIX;


open O,"$ARGV[0]" or die "$!\n";

my $head = <O>;
print "$head";
while(<O>){
	chomp;
	my @d = split("\t",$_);
	my @accs = split(";",$d[4]);
	my @new;
	foreach my $acc (@accs){
		if($acc =~ m/^XP_/ || $acc =~ m/^###REV###XP_/){

		}else{
			if($acc =~ m/^###/){
				$acc =~ s/###REV###/###REV###VAR|/;
			}else{
				$acc = "VAR|$acc";
			}
			
		}
		push @new,$acc;
	}

	$d[4] = join(";",@new);
	print join("\t",@d),"\n";
}

close O;