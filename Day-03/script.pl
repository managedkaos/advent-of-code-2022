use Data::Dumper qw(Dumper);
$total = 0;

@keys = ("a".."z", "A".."Z");
@values = (1..52);

@priority{@keys} = @values;

while (<>) {
    chomp;
    $size = length($_);
    $half_size = $size / 2;
    $compartment1 = substr($_, 0, $half_size);
    $compartment2 = substr($_, $half_size);

    print "$_ => $compartment1, $compartment2 => ";

    foreach $letter (split(//, $compartment1)) {
        if ($compartment2 =~ /$letter/) {
            print "$letter => ";
            print "$priority{$letter}\n";
            $total += $priority{$letter};
            last;
        }
    }
}

print "$total\n\n";