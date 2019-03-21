def my_min(arr) # n^2 time complexity

  minimum = arr.first
  (0...arr.length - 1).each do |first|
    
    (first+1...arr.length).each do |second|
      minimum = arr[first] if arr[first] < minimum
    end
    
  end
  return minimum
end

def my_min_2(arr)  # Linear Time
  
  minimum = arr.first
  arr.each do |el|
    if el < minimum
      minimum = el
    end
  end
  minimum

end

# list = [ 3, 0, 5, 4, -5, 10, 1, 90 ]
# puts my_min(list)

def largest_contiguous_subsum(arr)      # n^2 time complexity, nested loops dominate linear subarrays.each
  subarrays = []
  (0...arr.length).each do |starting_idx|
    (0...arr.length - starting_idx).each do |length|
      subarrays << arr[starting_idx..starting_idx+length]
    end
  end
  
  hash = Hash.new
  subarrays.each do |subarr|
    hash[subarr]=subarr.sum
  end
  
  hash.max_by { |k,v| v} [1]

end


def largest_contiguous_subsum1(arr) # o(1) space
  
  puts "I am being passed #{arr}!"
  return arr[0] if arr.length <= 1
  arr.each_with_index do |element, starting_idx|
    puts "im looking at #{starting_idx}"
    return element + largest_contiguous_subsum1(arr[starting_idx+1..-1])
  end
  
end


def largest_contiguous_subsum2(a) #uses linear time and constant space
  max_ending_here = max_so_far = 0 
  n = a.length
  i = 0
  while i < n
   max_ending_here = [0,(max_ending_here + a[i]) ].max
   max_so_far = [max_so_far, max_ending_here].max
   i += 1
  end
  max_so_far
end


list = [-7, 3, 5]
p largest_contiguous_subsum2(list)


