raw_input = File.readlines('input.txt')
# raw_input = File.readlines('test-input.txt')
debug = true
input = raw_input.map { |line|  line.strip.split('')}

input.each do |line|
  line.map! do |char|
    char == '@' ? char = 1.to_i: char = 0.to_i
  end   
  # p line 
end

add = 1
sum = 0

while add > 0 do
  new_input = input.map(&:clone)
  
  for i in 0..input.length-1 do
    for j in 0..input[i].length-1
      if input[i][j] == 1
           
        j == 0 ? prev_col = 0 : prev_col = j-1
        j == input[i].length-1 ? next_col = input[i].length-1 : next_col = j+1
        
        prev_sum = i == 0 ? 0 : input[i-1][prev_col..next_col].map(&:to_i).sum
        cur_sum = input[i][prev_col..next_col].map(&:to_i).sum
        next_sum = i == input.length-1 ? 0 : input[i+1][prev_col..next_col].map(&:to_i).sum
        
        
        inner_sum = prev_sum + cur_sum + next_sum - 1
        inner_sum < 4 ? new_input[i][j] = 'X' : 0
      else
        new_input[i][j] = 0
      end
    end
  end
  
  add = new_input.flatten.count('X')
  
  new_input.each do |line|
    line.map!{ |x| x == 'X' ? x = 0 : x }
  end
    
  sum += add 

  input = new_input
end

# input.each do |line|
#   p line
# end

p sum
