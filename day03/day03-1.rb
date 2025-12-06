banks = File.readlines('input.txt')
# banks = File.readlines('test-input.txt')
# 
#
# 987654321111111 98
# 811111111111119 89
# 234234234234278 78
# 818181911112111 92

banks.map! {|bank| bank.strip.split('').map{|i| i.to_i}}

joltages = []

banks.each do |bank|
  bank_joltages = []
  bank.combination(2) do |combination| 
    bank_joltages.push(combination.join('').to_i)
  end
  joltages.push(bank_joltages.max)
end

p joltages.sum()
