

def convert(num, to)
  digits = %w[0 1 2 3 4 5 6 7 8 9 A B C D E F]
  res = ''
  local_num = num
  if to <= 16
    while local_num > 0
      res += digits[local_num % to]
      local_num /= to
    end
  else
    raise StandardError, 'The value of "to" must be less or equal to 16!'
  end

  res.reverse
end

begin
  puts "Converting a decimal number to a given number system."
  print "Enter value: "
  value = gets
  print "Enter system: "
  system = gets
  print convert value.to_i, system.to_i
rescue
  print 'The value of number system must be less or equal to 16! Try again.'
end

