data = IO.read('./football.dat')
lines = data[%r{<pre>([^<]+)</pre>}].gsub('-', '').split("\n")

#rows = lines[5..-2].map(&:split); labels = lines[3].split
#
#days = {}
#rows.each do |row|
#  days[row.first] = {}
#  row.each_with_index do |val, i|
#    days[row.first][labels[i].to_sym] = val.to_f
#  end
#end
#
#min = 10000; min_no = -1
#
#days.each do |day_no, day|
#  if day[:MxT] - day[:MnT] < min
#    min = day[:MxT] - day[:MnT]
#    min_no = day_no
#  end
#end
#
#puts "Lowest temperature spread #{min} on day #{min_no}."

rows = lines[2..-2].map(&:split); labels = lines[1].split

teams = {}
rows.each do |row|
  unless row.empty?
    teams[no=row.delete_at(0).to_i] = {}
    row.each_with_index do |val, i|
      teams[no][labels[i].to_sym] = val
    end
  end
end

min = 10000; min_no = -1

teams.each do |team_no, team|
  if (delta = (team[:F].to_i - team[:A].to_i).abs) < min
    min = delta
    min_no = team_no
  end
end

puts "Lowest goal difference #{min} by #{teams[min_no][:Team]}."
