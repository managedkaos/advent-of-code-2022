use Data::Dumper qw(Dumper);
$total = 0;

@keys = ("a".."z", "A".."Z");
@values = (1..52);

@priority{@keys} = @values;

@lines = ();

while (<>) {
    chomp;
    push(@lines, $_);

    if ($. % 3 == 0) {
        foreach $letter (split(//, $lines[0])) {
            if ($lines[0] =~ /$letter/ && $lines[1] =~ /$letter/ && $lines[2] =~ /$letter/) {
                #print "$letter => $priority{$letter}\n";
                $total += $priority{$letter};
                @lines = ();
                last;
            }
        }
    }
}

print "$total\n\n";