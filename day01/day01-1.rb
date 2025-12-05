

# read the file
rotations =  File.readlines("input.txt")
# rotations =  File.readlines("inpu2.txt")

# mappoing rotations
rotations.map! do |r| 
    r = r[0] == "L" ? r[1..].to_i*-1 : r[1..].to_i
end

cursor = 50
range = (0..99)
counter = 0

rotations.each do |r|
    print cursor, "+" , r
    cursor = cursor+r
    print "=",cursor," "
    if cursor > 99
        cursor -= 100
        counter+=1
    elsif cursor < 0
        cursor += 100
        counter+=1
    else 
        cursor
    end
    
    
    puts "cursor: #{cursor} counter: #{counter}"
end

puts counter