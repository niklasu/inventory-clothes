def import
    require "json"
    puts "Importing import.json"
    file = File.open "import.json"
    data = JSON.load file
end


def anzeige(inventar)
    puts "Inventar"

    oberteile = inventar['oberteile']

    puts \
        "Oberteile: \
            #{oberteile['tshirts']} tshirts\
            #{oberteile['pullover']} pullover\
            #{oberteile['hemden']} hemden\
            #{oberteile['jacken']} jacken\
        "
        unterteile = inventar['unterteile']
        puts \
        "Unerteile: \
            #{unterteile['hosen']} hosen\
        "
end

puts "Hauptmenü. 1 - Inventar anzeigen"
choice = gets.strip
case choice
when "1"
    anzeige import
end
