data = IO.read('./weather.dat')
lines = data[%r{<pre>([^<]+)</pre>}].split("\n")

rows = lines[5..-2].map(&:split); labels = lines[3].split

days = {}
rows.each do |row|
  days[row.first] = {}
  row.each_with_index do |val, i|
    days[row.first][labels[i].to_sym] = val.to_f
  end
end

max = 0; max_no = -1

days.each do |day_no, day|
  if day[:MxT] - day[:MnT] > max
    max = day[:MxT] - day[:MnT]
    max_no = day_no
  end
end

puts max_no