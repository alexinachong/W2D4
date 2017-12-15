# n^2 two sum solution
def bad_two_sum?(arr, target_sum)
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      if arr[i] + arr[j] == target_sum
        return true
      end
      j += 1
    end
    i += 1
  end
  false
end


# arr = [0, 1, 5, 7]
# puts bad_two_sum?(arr, 6) # => should be true
# puts bad_two_sum?(arr, 10) # => should be false

# n log n runtime
def okay_two_sum?(arr, target_sum)
  sorted = arr.sort

  arr.each_with_index do |el, i|
    complement = target_sum - el

    if bsearch(arr[(i + 1)..-1], complement)
      return true
    end
  end
  false
end

def bsearch(arr, target)
  midpoint = arr.length / 2

  if arr.length <= 1 && arr[midpoint] != target
    return false
  elsif arr[midpoint] == target
    return true
  end

  left = arr.slice(0, midpoint)
  right = arr.slice(midpoint, arr.length)

  if arr[midpoint] >= target
    bsearch(left, target)
  else
    bsearch(right, target)
  end
end

arr = [-3, 0, 1, 2, 6]
# puts bsearch(arr, 2)
# puts bsearch(arr, 3)

# puts okay_two_sum?(arr, 3)
# puts okay_two_sum?(arr, 100)

def two_sum?(arr, target)
  m_hash = {}
  arr.each_with_index do |e, i|
    complement = target - e
    if m_hash.key?(complement)
      return true
    else
      m_hash[e] = true
    end
  end
  false
end

puts two_sum?(arr, 3)
puts two_sum?(arr, 100)
