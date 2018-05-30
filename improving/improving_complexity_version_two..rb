
# This method takes n arrays as input and combine them in sorted ascending  order
def second_pass(*arrays)
  combined_array = arrays.pop
  arrays.each do |array|
    array.each do |value|
      combined_array << value
    end
  end

  sort(combined_array)
end

def sort(collection, from=0, to=nil)
 if to == nil
   # Sort the whole collection, by default
   to = collection.count - 1
 end

 if from >= to
   # Done sorting
   return
 end

 # Take a pivot value, at the far left
 pivot = collection[from]

 # Min and Max pointers
 min = from
 max = to

 # Current free slot
 free = min

 while min < max
   if free == min # Evaluate collection[max]
     if collection[max] <= pivot # Smaller than pivot, must move
       collection[free] = collection[max]
       min += 1
       free = max
     else
       max -= 1
     end
   elsif free == max # Evaluate collection[min]
     if collection[min] >= pivot # Bigger than pivot, must move
       collection[free] = collection[min]
       max -= 1
       free = min
     else
       min += 1
     end
   else
     raise "Inconsistent state"
   end
 end

 collection[free] = pivot

 sort collection, from, free - 1
 sort collection, free + 1, to

 collection
end


first = [1,3,5,7,9]
second = [2,4,6,8]

puts second_pass(first,second)
