# Subsums
# Phase I
def my_min_n2(list)
  list.each_with_index do |el, i|
    flag = true
    list.each_with_index do |el2, j|
      next if i == j

      if el > el2
        flag = false
      end

    end
    return el if flag
  end
end

# Phase II
def my_min_n(list)
  smallest = list.first

  list.each_with_index do |el, i|
    next if i == 0
    if smallest > el
      smallest = el
    end
  end
  smallest
end

# Largest Contiguous Sub-Sum
# Phase 1
def largest_contiguous_subsum_n2(list)
  return nil if list.empty?

  largest_possible_subsum = list.first
  i = 0
  while i < list.length
    j = i
    while j < list.length
      sum = list[i..j].inject(:+)
      if sum > largest_possible_subsum
        largest_possible_subsum = sum
      end
      j += 1
    end
    i += 1
  end
  largest_possible_subsum
end

# Phase II
def largest_contiguous_subsum_n(list)
  # beginning = 0
  # last = 0
  # sum = list[beginning..last].inject(:+)
  # i = 1
  # while i < list.length
  #   potential_sum = list[beginning..i].inject(:+)
  #   if potential_sum >= sum
  #     last = i
  #   end
  #   i += 1
  # end
end

def largest_contiguous_subsum_n(list)
  return list.sort.last if list.all? { |el| el < 0 }

  largest = list.first
  total = largest

  i = 1
  while i < list.length
    total += list[i]
    if total > largest
      largest = total
    elsif total <= 0
      total = 0
    end
    i += 1
  end
  largest
end
