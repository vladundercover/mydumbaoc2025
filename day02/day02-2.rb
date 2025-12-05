
ranges = File.read('input.txt')
# ranges = File.read('test-input.txt')

ranges = ranges.split(',')

debug = false

sum = 0
ranges.each do |range|
  range = range.split("-")
  
  numbers = (range[0].to_i..range[1].to_i)

  numbers.each do |num|

    token = num.to_s
    patterns = []
    for i in 1..token.length/2
      patterns.push(token[..i].to_s)
      patterns.push(token[1..i].to_s) if i > 1
      patterns.push(token[token.length-1-i..token.length-1].to_s)
    end
    patterns = patterns + num.to_s.split("")
    patterns.uniq!
    

    puts "=======" if debug
    puts token if debug
    puts patterns.to_s if debug

   
    patterns.each do |pattern|
        if token == token.scan(pattern).join('') and pattern.length < token.length
          puts "There is a pattern! " + pattern.to_s if debug
          sum += num
          break
        end
    end
  
  end
end

puts sum
