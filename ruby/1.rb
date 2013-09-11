# Multiples of 3 and 5
# Problem 1

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

def candidate? num
  if (num % 5 == 0) || (num % 3 == 0)
    true
  else
    false
  end
end

acc = 0

1.upto(999).each do |x|
  if candidate? x
    puts x 
    acc = acc + x
  end
end

puts acc

