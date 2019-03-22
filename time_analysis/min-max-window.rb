def windowed_max_range(arr, window_size)

  current_max_range = nil
  (0..arr.length-window_size).each do |start|
    max = arr[start+window_size-1]
    min = arr[start]
    (start..start+window_size-1).each do |ele|
      max = ele  if ele > max 
      min = ele if ele < min
    end
    
  end

end





# windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8