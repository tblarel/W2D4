def bad_two_sum?(arr, target) #determined that our time and space complexity will be n^4
  pairs = arr.permutation(2).to_a
  pairs.each do |pair|
    return true if pair.sum == target
  end
  return false

end

def okay_two_sum?(arr,target) # sort takes nlogn time, searching sorted arr for pairs takes additional n time : TOTAL : n^2
  arr.sort!                   # linear space complexity
  left = 0
  right = -1
  while arr[left] != arr[right]
    #puts "checking index left: #{left} and index right #{right}"
    sum = arr[left] + arr[right]
    case sum <=> target
      when 0
        return true
      when 1
        right -=1
      when -1
        left += 1
    end
  end
  return false
end


def two_sum?(arr, target) # Linear time and constant space for this implementation
  
  hash = Hash.new(0)
  arr.each do |el|
    hash[el] += 1
  end


  hash.each do |k, v|
    hash[k] -= 1
    return true if hash.keys.include?(target - k) && hash[target - k] > 0
    hash[k] += 1
  end
  return false

end

arr = [0, 1, 5, 7]

# arr = [0, 1, 5, 7, 8, 3, 0, 4, 10, 2, 1, 1, 5, 7, 8, 3, 0, 4, 10, 2, 1]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false