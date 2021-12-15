content = [0, 1, 0, 1, 0, 1, 0, 1]
reverse = false

8.times do
  if reverse
    # print content array in reverse
    for i in 1..content.length
      print "#{content[-i]}  "
    end
  else
    content.each do |num|
      print "#{num}  "
    end
  end

  puts "\n"
  reverse = !reverse  #set reverse to opposite after every 1 line
end
