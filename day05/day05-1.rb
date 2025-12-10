raw_input = File.readlines('input.txt')
# raw_input = File.readlines('test-input.txt')

all_input = raw_input.map! { |line|  line.strip}

input_separator = all_input.index('')

ranges = all_input[...input_separator]
ranges.map! {|r| r.split('-')}

values = all_input[input_separator+1..]

# p ranges
# p values

sum = 0

values.each do  |value|
  # p value
  ranges.each do |range|
    # p (range[0].to_i..range[1].to_i)
    if (range[0].to_i..range[1].to_i).cover?(value.to_i) 
      sum += 1
      break
    end
  end
  # p sum
end

p sum
