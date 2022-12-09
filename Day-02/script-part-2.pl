#!/usr/bin/env perl
# The first column is what your opponent is going to play:
# A X for Rock
# B Y for Paper
# C Z for Scissors.

# Rock defeats Scissors
# Scissors defeats Paper
# Paper defeats Rock.
# If both players choose the same shape, the round instead ends in a draw.

# X means you need to lose
# Y means you need to end the round in a draw
# Z means you need to win. Good luck!"
%strategy = (
    AX => 'Z', AY => 'X', AZ => 'Y',
    BX => 'X', BY => 'Y', BZ => 'Z',
    CX => 'Y', CY => 'Z', CZ => 'X'
);

# The score for a single round is the score for the shape you selected
# 1 for Rock
# 2 for Paper
# 3 for Scissors

# plus the score for the outcome of the round
# 0 if you lost
# 3 if the round was a draw
# 6 if you won

# What would your total score be if everything goes exactly according to your strategy guide?

$total = 0;

%score = (
    AX => 4, AY => 8, AZ => 3,
    BX => 1, BY => 5, BZ => 9,
    CX => 7, CY => 2, CZ => 6
);

while (<>) {
    chomp;
    ($opponent, $player) = split /\s+/;
    print $strategy{$opponent . $player};
    $total += $score{$opponent . $strategy{$opponent . $player}};
}

print "\n$total\n";
