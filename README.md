# advent-of-code

**My solutions to Advent of Code 2022 problems**

## Description

This is my first year attempting [Advent of Code](https://adventofcode.com) having only recently discovered it and hope to participate in the years to come. I may solve problems from previous years in the near future.

Each folder contains solutions for both parts of the respective problem and the problem input data. The hierarchy below shows this:
```
day1
└───day1-part1.lua // Solution for part 1.
│   
└───day2-part2.lua // Solution for part 2.
|
└───day2.txt // Problem input data.
```

## Solution Principles

I've tried to follow certain principles when writing solutions which can sometimes add or remove complexity:
- Account for different input - this means that each solution should theoretically run and complete with input data different to mine assuming it's valid.
- Ignore Previous Part Answer - meaning a part 2 solution will not use the answer for part 1. This often results in having to re-consider the solution for part 2 however I feel that to be more appropriate than defining arbitrary values.