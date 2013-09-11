require 'prime'

primes = []
(1..10000).each do |p|
  primes.push p if p.prime?
end

factor = 600851475143

primes.reverse.each do |p|
  if factor % p == 0
    puts p
    break
  end
end
