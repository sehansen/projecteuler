#!/usr/bin/env python
from math import floor, ceil

# Zero magic squares to begin with
i = 0

# Generate 1. row and calculate the sum of the magic square
for a1 in xrange(10):
 for a2 in xrange(10):
  for a3 in xrange(10):
   for a4 in xrange(10):
    sum = a1+a2+a3+a4

    # Generate 1. column
    for b1 in xrange(10):
     for c1 in xrange(10):
      d1 = sum - a1 - b1 - c1

      # Check 1. column for sanity
      if 9 < d1: continue
      if d1 < 0: break
      
      # The cells b3, b4, c2, c3, c4, d2, d3 and d4 can be
      # uniquely expressed in terms of two of them
      # Right now those two are d3 and d4, but b3 and c3
      # would be nicer as b4, c2 and d2 could be expressed
      # only in terms of b3.
      # For each possible value of b2
      for b2 in xrange(10): # and d4
       for d4 in xrange(10): # c3 is uniquely defined
        c3 = -a1 -b2 -d4 + sum
        if c3 > 9: continue
        if c3 < 0: break
        # if c3 is good
        # the rest of the variables are uniquely for each value of d3
        for d3 in xrange(10): 
         b3 = a1 -a3 +b2 -d3 +d4
         if b3 > 9: continue
         if b3 < 0: break
         b4 = -2*a1 +a3 -2*a4 -2*b2 +c1 -d1 +d3 -3*d4 +2*sum
         if b4 > 9: continue
         if b4 < 0: break
         c2 = -a1 +a3 -a4 -b2 -d1 +d3 -d4 +sum
         if c2 > 9: continue
         if c2 < 0: break
         c4 = 2*a1 -a3 +a4 +2*b2 -c1 +d1 -d3 +2*d4 -sum
         if c4 > 9: continue
         if c4 < 0: break
         d2 = -d1 -d3 -d4 +sum
         if d2 > 9: continue
         if d2 < 0: break
         # as we didn't take the b-line into account when we solved
         # we may need to reject some answers
         if b1 + b2 + b3 + b4 != sum: continue
         # otherwise we count and print every thousand valid square
         i = i +1
         if i % 1000 == 0: 
          print a1, a2, a3, a4, "=", sum, " | ", i
          print b1, b2, b3, b4
          print c1, c2, c3, c4
          print d1, d2, d3, d4
          print

# and of course we need to print teh result
print i
