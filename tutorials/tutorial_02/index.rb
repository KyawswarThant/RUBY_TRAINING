star = "*"
space = 10
decre = 4   #set decrement value for star when it reach 11"

22.times do |i|

  unless i % 2 == 0

    if i < 12

      space.times do
        # add space infront of star
        print " "
      end

      i.times do
        print "#{star} "
      end

      puts "\n\n"   # add 2 line after every line"
      space -= 2 unless i == 11
      
    else
      space += 2

      space.times do
        # add space infront of star
        print " "
      end

      (i-decre).times do
        print "#{star} "
      end

      puts "\n\n"
      decre += 4  # plus decrement value to 4 to adjust star count"
    end

  end

end