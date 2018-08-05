# quicksort

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



# Heap Sort

def heap_sort(array)
  build_heap(array)
  unsorted = array.length - 1
  while(unsorted > 0)
    array[0], array[unsorted] = array[unsorted], array[0]
    unsorted -=1
    heapify(array, 0, unsorted)
  end
  
return array
end

def build_heap(array)
  parents = ((array.length)/2)
  while parents >= 0
    heapify(array, parents, array.length - 1)
    parents -= 1
  end
  return array
end

def heapify(array, i, ending)
  child_left = (i * 2)
  child_right = (i * 2) + 1
  leaf = i >= ending || (i > array.length/2)
  good_left = child_left > ending || array[i] >= array[child_left]
  good_right = child_right > ending || array[i] >= array[child_right]
  good = good_left && good_right
  return if leaf || good
  children = child_left
  unless array[child_right].nil?
    if array[child_left] < array[child_right]
      children = child_right
    end
  end
  unless array[i] >= array[children]
    if children <= ending
      array[i], array[children] = array[children], array[i]
    end
  end
  heapify(array, children, ending)
end

# Bucket Sort

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

# testing
array0 = [9,3,4,5,1,7,0,5,8,7,4]
array1 = [9,3,4,5,1,7,0,5,8,7,4]
array2 = [9,3,4,5,1,7,0,5,8,7,4]
array3 = [9,3,4,5,1,7,0,5,8,7,4]

puts
puts "unsorted"
print array0
array0.sort!
puts
puts "sorted"
print array0

puts
puts "quick sort"
print quick_sort(array1)

# puts
# puts "heapify"
# print build_heap(array2)

puts
puts "heap sort"
print heap_sort(array2)


puts
puts "bucket sort"
print bucket_sort(array3)





