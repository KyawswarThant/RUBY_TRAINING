content = [0, 1, 0, 1, 0, 1]
reverse = false
8.times do
  
  if reverse

    for i in 1..content.length do
      print "#{content[-i]}  "
    end

  else

    content.each do |num|
      print "#{num}  "
    end

  end
  
  puts "\n"
  reverse = !reverse
end