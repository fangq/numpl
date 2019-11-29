#!/usr/bin/perl

package NumPl;

use strict;
use warnings;

use vars qw( $VERSION %typebyte);
$VERSION = '0.2';

use Data::Buffer;
use Exporter;

our @EXPORT_OK = qw(array zeros ones eye reshape dtype show);
our %dtype= ("uint8" => 1, "int8" => 1, "uint16" => 2, "int16" => 2, 
             "uint32" => 4, "int32" => 4, "uint64" => 8, "int64" => 8, 
             "single" => 4, "double" => 8, "float32" => 4, "float64" => 8,
             "complex" => 8, "complex64" => 4, "float16" => 2);

sub new {
    my $class = shift;
    my %arg = (dtype => 'uint8', size => 0, bytelen =>0);

    $arg{buf}=Data::Buffer->new;

    bless { (%arg, @_) }, $class;
}

sub array {
    my $self = shift;
    my ($data,$opt) = @_;
    if(defined $opt && $opt{"dtype"} ne ''){
    }
}
 
sub asarray {
  my ($x, $y) = @_;
  return $x * $y;
}

sub flatten {  # no prototype for this one to avoid warnings
    return map { ref eq 'ARRAY' ? flat(@$_) : $_ } @_;
}

sub issame {
	my @a=@_;
	return 'NULL' if length(a) == 0;
	my $mytype=ref $a[0];
	my $issame=1;
	map { $issame=0 if (ref $_ ne $mytype) } @_;
	return ($issame)?$mytype:"";
}
 
1;
