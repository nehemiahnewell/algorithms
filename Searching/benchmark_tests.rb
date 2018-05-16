require 'benchmark'

def fib_iter(n)
  fib_0 = 0
	fib_1 = 1
  for x in 0..n do
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_0
  end
  return fib_1
end

def fib_recur(n)
  if (n == 0)
    # #1
    return 0
  elsif (n == 1)
    # #2
    return 1
  else
    # #3
    return fib_recur(n-1) + fib_recur(n-2)
  end
end

Benchmark.bm do |bm|
  bm.report("fibonnaci recursive 20") do
    fib_recur(20)
  end
  bm.report("fibonnaci iterative 20") do
    fib_iter(20)
  end
end
