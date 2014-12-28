package BusHelper;

# when 980.html returns a bunch of 980-like bus lines
# return 
# {
#    xa_adfa778ab => 980lu
#    xb_adf7668ba => zhuan980
# }
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


# given a bus line number, such as 980, we get the file 980.html
# return whether it's a page including all stations of line 980
# or it return a page including a bunches of 980-like lines
sub is_bunch {
  my $bus_code = shift;

  my $file = $bus_code . ".html";
  my $content = `cat $file`;
  chomp $content;

#  my $regex = '<div class="sr-hd">ËÑË÷¡°' . $bus_code . '¡±½á¹û</div>';
  my $regex = 'ËÑË÷¡°' . $bus_code . '¡±½á¹û';

  print $regex . "\n";
  if($content =~ /$regex/) {
    return 1;
  } else {
    return 0;
  }
}

my $is_bunch = is_bunch(980);
if($is_bunch) {
  print "980.html is a bunch file\n";
} else {
  print "980.html is not a bunch file\n";
}


print "980.html's content is:\n";
my $buses = get_buses(980);
foreach my $key (keys %$buses) {
  print "$key   compare   $buses->{$key}\n";
}
