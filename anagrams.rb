require 'byebug'

# n! runtime
def first_anagram?(string, string2)
  arr = string.split('')
  list_of_perms = permutation(arr)


  list_of_perms.map! do |perm|
    perm.join
  end

  list_of_perms.include?(string2)
end


def permutation(arr)
  return [arr] if arr.length <= 1

  # take the previous permutation and in each of those,
  # duplicate that array (those), insert the new element at every index
  # put that into a container, then remove it, then insert again

  # [0, 1]
  previous_permutation = permutation(arr[0..-2]) # [[0]]
  last_element = arr.last # 1
  dupped = previous_permutation.dup # [[0]]
  container = []
  i = 0
  while i < dupped.length # 1
    j = 0
    while j <= dupped[i].length # 1
      dupped[i].insert(j, last_element) # [1, 0] --> [0, 1]
      container << dupped[i].dup # container = [[1, 0], [0, 1]]
      dupped[i].delete_at(j) # [0] --> [0]
      j += 1
    end
    i += 1
  end
  container
end

puts first_anagram?('gizmo', 'sally')
puts first_anagram?('elvis', 'lives')

# n^2 runtime
def second_anagram?(string1, string2)
  string1_arr = string1.chars
  string2_arr = string2.chars

  i = 0
  while i < string1_arr.length
    if string2_arr.include?(string1_arr[i])

      matching_char = string1_arr[i]
      matching_char_index_at_string2 = string2_arr.index(matching_char)

      string2_arr[matching_char_index_at_string2] = nil
      string1_arr[i] = nil
    end
    i += 1
  end
  string1_arr.reject! {|el| el.nil? }
  string2_arr.reject! {|el| el.nil? }
  string1_arr.empty? && string2_arr.empty?
end

puts second_anagram?('gizmo', 'sally')
puts second_anagram?('elvis', 'lives')

# n log n (Ruby sort uses quick sort) runtime
def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end

puts third_anagram?('gizmo', 'sally')
puts third_anagram?('elvis', 'lives')


# 3n => O(n) runtime
def fourth_anagram?(string1, string2)
  counts = Hash.new(0)

  i = 0
  while i < string1.length
    counts[string1[i]] += 1
    i += 1
  end

  j = 0
  while j < string2.length
    if !counts[string2[j]]
      return false
    else
      counts[string2[j]] -= 1
    end
    j += 1
  end

  counts.values.all? { |el| el == 0 }
end

puts fourth_anagram?('gizmo', 'sally')
puts fourth_anagram?('elvis', 'lives')
