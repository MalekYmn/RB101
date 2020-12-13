munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_value do |value|
  ag = "age_group"
  if (0..17).include?(value["age"])
    value[ag] = "kid"
  elsif (18..64).include?(value["age"])
    value[ag] = "adult"
  else
    value[ag] = "senior"
  end
end

p munsters