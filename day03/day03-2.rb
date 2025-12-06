banks = File.readlines('input.txt')
# banks = File.readlines('test-input.txt')
debug = true
banks.map! {|bank| bank.strip.split('').map{|i| i.to_i}}

joltages = []

banks.each do |bank|
  
  print "bank is ", bank.join(''), "\n" if debug

  bank_joltage = []
  
  a = 0
  z = -12
  12.times do
    window = bank[a..z]
    print "bank is ", bank.join(''), "\n" if debug

    print "rang is ", window.join(''), "\n" if debug

    max = window.max
    print "a ", a , "\n" if debug
    print "z ", z , "\n" if debug
    print "max ", max, "\n" if debug

    bank_joltage.push(max)

    a += window.index(max)+1
    z += 1

    print "current joltage ", bank_joltage.join(''), "\n" if debug
  end

  joltages.push(bank_joltage.join('').to_i)

end

# p joltages
p joltages.sum