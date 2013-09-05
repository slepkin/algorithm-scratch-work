require 'set'

#Can one make a given ransom note by cutting words out of a given magazine?
def ransom?(note, magazine)
  magazine_words = Set.new(magazine.split(" "))
  note.split(" ").all? {|word| magazine_words.delete?(word)}
end

#Permutations, assuming no repeated characters
def permutations(string)
  return [string] if string.length == 1

  sub_permutations = permutations(string[1..-1])
  insertee = string[0]
  permutations = []

  (0...string.length).each do |i|
    sub_permutations.each do |sub_perm|
      permutations << sub_perm[0...i] + insertee + sub_perm[i..-1]
    end
  end

  permutations
end

def replace_space_with(str, replace)
  result = ""
  in_space = false

  str.each_char do |char|
    if char == " "
      result += replace unless in_space
      in_space = true
    else
      result += char
      in_space = false
    end
  end

  result
end

#Remove repeated characters from string
def compress(str)
  result = ""
  last_char = nil

  str.each_char do |char|
    next if char == last_char

    result << char
    last_char = char
  end

  result
end

#Rotate square matrix clockwise
def rotate(matrix)
  width = matrix.length
  transform = Hash.new

  width.times do |y|
    width.times do |x|
      transform[[x, width-1-y]] = matrix[y][x]
    end
  end

  transform
end