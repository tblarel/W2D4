def first_anagram?(string1, string2)     # Space and time complexity are n!
  arr1 = string1.split('')
  all_words = arr1.permutation.to_a
  all_words.map { |word| word.join('') }
  all_words.include?(string2)
end



def second_anagram?(string,string2)

  string.each_char.with_index do |char,idx|
    charidx = string2.index(char)
    return false if charidx.nil?
    string2.slice!(charidx)
  end
  return true if string2.empty?
end


def third_anagram?(string, string2)
  return string.split('').sort!.join('') == string2.split('').sort!.join('')
end

def fourth_anagram?(string, string2)
  hash = Hash.new { |h,k| h[k] = 0 }

  string.each_char do |char|
    hash[char] += 1
  end
  
  string2.each_char do |char|
    hash[char] -= 1
  end

  hash.values.all? { |v| v.zero? }


end


p fourth_anagram?("ggizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true