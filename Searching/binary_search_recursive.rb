def search(array, targetValue, min = 0, max = (array.length - 1))
  guess = (max + min)/2
  if min <= max
    if (array[guess] == targetValue)
      return guess
    elsif array[guess] < targetValue
      min = guess + 1
      search(array, targetValue, min, max)
    elsif(array[guess] > targetValue)
      max = guess - 1;
      search(array, targetValue, min, max)
    end
  end
  return false
end
  
  
arr = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]

value = search(arr, 10)
puts value