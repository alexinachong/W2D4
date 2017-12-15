# n^2 runtime
def windowed_max_range(arr, window_size)
  current_max_range = nil

  arr.each_with_index do |e, i|
    window = arr[i...i+window_size]
    max = window.max
    min = window.min

    diff = max - min

    if !current_max_range || current_max_range < diff
      current_max_range = diff
    end
  end
  current_max_range
  counts
end

puts windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
puts windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
puts windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
puts windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
