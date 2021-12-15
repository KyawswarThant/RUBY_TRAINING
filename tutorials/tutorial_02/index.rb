star = "*"
space = 10
decre = 4

22.times do |i|

  unless i % 2 == 0

    if i < 12

      space.times do
        print " "
      end

      i.times do
        print "#{star} "
      end

      puts "\n\n"
      space -= 2 unless i == 11
      
    else
      space += 2

      space.times do
        print " "
      end

      (i-decre).times do
        print "#{star} "
      end

      puts "\n\n"
      decre += 4
    end

  end

end