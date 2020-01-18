require "json"
file = File.open "import.json"
data = JSON.load file

puts "Klamottenbestände"

oberteile = data['oberteile']

puts \
"Oberteile: \
    #{oberteile['tshirts']} tshirts\
    #{oberteile['pullover']} pullover\
    #{oberteile['hemden']} hemden\
    #{oberteile['jacken']} jacken\
"
unterteile = data['unterteile']
puts \
"Unerteile: \
    #{unterteile['hosen']} hosen\
"
