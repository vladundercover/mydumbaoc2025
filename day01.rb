
# # read the file
rotations =  File.readlines("input.txt")
# rotations =  File.readlines("test_input.txt")

logging = false

# mappoing rotations
rotations.map! do |r| 
    r = r[0] == "L" ? r[1..].to_i*-1 : r[1..].to_i
end
print rotations[..10], "\n" if logging

cursor = 50
counter = 0
range = (1..99)

rotations.each do |r|
    print "cursor #{cursor}+#{r} = #{cursor+r}"  if logging
    
    # cursor always 0..99
    
    cursor == 0? cursor += 100 : 1 if r < 0 
    

    cursor += r
    cursor < 0? counter += (cursor.abs+100)/100 : 1
    cursor > 99? counter +=  cursor/100 : 1
    cursor == 0? counter += 1 : 1
    
    cursor %= 100
    print "\n\t", "cursor now at ", cursor  if logging
    print "\n\t", "counter is ", counter, "\n"  if logging
end

puts counter
