hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, v|
  v.each do |s|
    s.chars.each do |l|
      puts l if ['a','e','i','o','u'].include?(l)
    end
  end
end

