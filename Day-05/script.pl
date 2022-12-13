#!/usr/bin/env perl
use Data::Dumper qw(Dumper);

$height = 0;

while (<>) {
    # If the line starts with 'move', read the instructions
    if (/^move\s+(\d+)\s+from\s+(\d+)\s+to\s+(\d+)/) {
        $move   = $1;
        $source = $2 - 1;
        $target = $3 - 1;

        # process the instructions for this move
        for $i (1 .. $move) {
            $x = shift(@{ $processed_crates[$source] });
            print "moving '$x' to @{ $processed_crates[$target] }\n";
            unshift(@{ $processed_crates[$target] }, $x);
        }

    # if this is the row with stack numbers, transpose the matrix
    } elsif (/^\s+\d+/) {

        # transpose
        for my $row (0..@crates - 1) {
            for my $col (0..@{$crates[$row]} - 1) {
                $processed_crates[$col][$row] = $crates[$row][$col];
            }
        }

        # remove any spaces and undefs at the front of each stack of crates
        for my $row (0..@processed_crates - 1) {
            while ($processed_crates[$row][0] !~ /[a-zA-Z0-9]/) {
                shift @{$processed_crates[$row]};
            }
        }

        print "# BEFORE:\n";
        print Dumper \@processed_crates;

    } else {

        # remove the brackts from the crate IDs
        s/\[//g;
        s/\]//g;

        # split on white space
        @input = split(/\s+/);

        # add the crate to a stack
        for $stack (0 .. $#input) {
            $crates[$height][$stack] = $input[$stack];
        }

        # increment the height counter
        $height += 1;
    }
}

print "# AFTER:\n";
print Dumper \@processed_crates;

# print the "top" of each stack of crates
print "Top crate on each stack is: ";

for my $row (0..@processed_crates - 1) {
    print "$processed_crates[$row][0]";
}

print "\n";