class Range
  def overlap?(range_b)
    (self.first <= range_b.first && range_b.first <= self.last) ||
    (self.last >= range_b.last && range_b.last >= self.first)
  end
end

raw_input = File.readlines('input.txt')
# raw_input = File.readlines('test-input.txt')

all_input = raw_input.map! { |line|  line.strip}

input_separator = all_input.index('')

ranges = all_input[...input_separator]
ranges.map! {|r| r.split('-')}
ranges.map! {|r| (r[0].to_i..r[1].to_i)}

ranges.sort_by do |range|
  range.begin
end

p ranges

uniq_values = 0

last_range = (0..1)



ranges.each do |range|
  p "#{last_range} <> #{range}"
  if last_range.overlap?(range)
    range = (last_range.last..range.last)
  end
  
  uniq_values += range.size
  last_range = range
  p "Added #{range.size}"
end

p uniq_values + 1
