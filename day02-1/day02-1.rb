
ranges = File.read('input.txt')

ranges = ranges.split(',')

sum = 0
ranges.each do |range|
  range = range.split("-")
  
  numbers = (range[0]..range[1])
  
  numbers.each do |num|
    
    token = num.to_s
    
    next if token.length % 2 != 0
    
    if token[...token.length/2] == token[token.length/2..]
      sum += num.to_i 
      puts num
    end 
    
  end
end

puts sum
