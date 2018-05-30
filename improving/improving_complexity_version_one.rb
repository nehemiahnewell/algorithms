
# This method takes n arrays as input and combine them in sorted ascending  order
def first_pass(*arrays)
  combined_array = arrays.pop
  arrays.each do |array|
    array.each do |value|
      combined_array << value
    end
  end

  sorted_array = [combined_array.pop]

  for val in combined_array
    flag = false
    (0..sorted_array.length-1).each do |i|
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        flag = true
        break
      end
    end
    if flag == false
      sorted_array << val
    end
  end

  # Return the sorted array
  sorted_array
end


first = [1,3,5,7,9]
second = [2,4,6,8]

puts first_pass(first,second)
