package BusHelper;

sub get_buses {
  my $bus_code = shift;
  my $file = $bus_code . ".html";
  my $content = `cat $file`;
  chomp $content;

  my %bus;
  while($content =~ /<a href=\"\/(.+?)\">($bus_code.*?)<\/a>/g) {
    # x_14071bae
    my $bus_code = $1;
    # 980路
    my $bus_line = $2;
    $bus{$bus_code} = $bus_line;
  }

  return \%bus;
}


my $buses = get_buses(980);
foreach my $key (keys %$buses) {
  print "$key   compare   $buses->{$key}\n";
}
