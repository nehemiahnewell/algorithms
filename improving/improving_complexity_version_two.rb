
# This method takes n arrays as input and combine them in sorted ascending  order
def second_pass(*arrays)
  combined_array = arrays.pop
  arrays.each do |array|
    array.each do |value|
      combined_array << value
    end
  end

  bucket_sort(combined_array)
end

def bucket_sort(array, size = 3)
  min = array.min
  max = array.max
  
  number_of_buckets = ((max - min)/size) + 1
  buckets = Array.new(number_of_buckets)
  (0..number_of_buckets - 1).each do |i|
      buckets[i] = []
  end
  i = 0
  while i < array.length
    # print array[i].to_s + " "
    buckets[((array[i] - min)/size)].push(array[i])
    i += 1
  end
  # puts
  # print buckets
  # puts
  (0..number_of_buckets - 1).each do |x|
    quick_sort(buckets[x])
  end
  array = buckets.flatten
end

def quick_sort(array, start = 0, ending = array.length - 1)
  if start <= ending
    pivot = divide_and_conquer(array, start, ending)
    quick_sort(array, start, pivot - 1)
    quick_sort(array, pivot + 1, ending)
  end
  return array
end

def divide_and_conquer(array, start, ending)
  # print "Divide and conquer "
  # print array
  # puts
  # puts
  pivot = array[ending]
  pivot_index = ending
  index = 0
  while index < pivot_index
    if array[index] > pivot
      # print "On pass " + index.to_s + ", " + array[index].to_s + " is greater then " + pivot.to_s
      # puts
      # print array
      # puts " bofore."
      array.insert(pivot_index + 1, array[index])
      array.delete_at(index)
      pivot_index = pivot_index - 1
      # print array
      # puts " after."
      index -= 1
    end
    index = index + 1
  end
  return pivot_index
end

first = [1,3,5,7,9]
second = [2,4,6,8]

puts second_pass(first,second)
