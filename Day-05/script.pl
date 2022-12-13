#!/usr/bin/env perl
$elf = 0;

while (<>) {
    $calories{$elf} += $_;
    if (/^$/) {
        $elf++;
    }
}

@calories_sorted_by_elf = sort { $calories{$b} <=> $calories{$a} } keys %calories ;

$elf_with_the_most_calories = $calories_sorted_by_elf[0];

$sum = $calories{$calories_sorted_by_elf[0]} + $calories{$calories_sorted_by_elf[1]} + $calories{$calories_sorted_by_elf[2]};

print "# Elf with the most calories...\n";
print "\t     Elf = $elf_with_the_most_calories\n";
print "\tCalories = $calories{ $elf_with_the_most_calories }\n\n";

print "# Sum of the calories held by the top three elves\n";
print "\t  Elf[1] = $calories{$calories_sorted_by_elf[0]}\n";
print "\t  Elf[2] = $calories{$calories_sorted_by_elf[1]}\n";
print "\t  Elf[3] = $calories{$calories_sorted_by_elf[2]}\n";

print "\t   Total = $sum\n";
