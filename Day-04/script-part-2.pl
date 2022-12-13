use Data::Dumper qw(Dumper);
$total = 0;

while (<>) {
    chomp;
    @sections = split(/,/, $_);

    ($a, $b) = split(/-/, $sections[0]);
    ($c, $d) = split(/-/, $sections[1]);

    # print "$a, $b, $c, $d\n";

    for ($a, $b, $c, $d) {
        $min = $_ if !$min || $_ < $min;
        $max = $_ if !$max || $_ > $max
    };

    @field{${min}..${max}} = ${min}..${max};
    @range1{${a}..${b}} = ${a}..${b};
    @range2{${c}..${d}} = ${c}..${d};

    # if the ranges are the same size, scan the entire field
    if (keys %range1 == keys %range2) {
        print "range lengths are equal; scan the entire field\n";
        @target =  keys %field;

    # if range1 is smaller than range2, use the keys from range1
    } elsif (keys %range1 < keys %range2) {
        print "range1 is smaller; use range1 keys\n";
        @target = keys %range1;

    # if range2 is smaller than range1, use the keys from range2
    } else {
        print "range2 is smaller; use range2 keys\n";
        @target = keys %range2;
    }

    # initialize the check; start with a negative check
    $check = 0;

    # consider each key in the target range
    foreach $key (sort @target) {
        # if at any point in the field, both ranges are equal, then they overlap
        $check = exists $range1{$key} && exists $range2{$key};
        print "$field{$key} == $range1{$key} == $range2{$key} => ";
        print "$check\n";

        # if the ranges overlap at the current key, there's no need to check any other keys
        last if $check;
    }

    $total += $check;

    $min = undef();
    $max = undef();
    undef %field;
    undef %range1;
    undef %range2;
    print "-\n";
}

print "$total\n\n";