#!/usesr/bin/perl
use strict;
use 5.14.0;
use warnings;
use Data::Dumper;

package Smalls::Gens;

my $hosts_file = '';

# sub add {
#   sudo open my $file, '>', $hosts_file
#     or die "Can't open $hosts_file: $!\n";

#   chomp( my @lines = <$file> );

#   close $file
#     or die "Can't close $hosts_file: $!\n";
# }

sub list {
  ($hosts_file) = @_;

  open my $file, '<', $hosts_file
    or die "Can't open $hosts_file: $!\n";

  chomp( my @lines = <$file> );

  close $file
    or die "Can't close $hosts_file: $!\n";

  my @list = ();
  my $group  = 'misc';

  foreach my $line (@lines) {
    my @data    = split /\s+/, $line;
    my %details = ();

    defined $data[0] or next;

    if ($data[0] =~ /\d/) {
      $details{'ip'} = $data[0];

      shift @data;

      $details{'list'} = \@data;

      push @list, \%details;
    }
  }

  return @list;
}

1;