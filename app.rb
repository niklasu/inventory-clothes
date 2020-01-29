def import
    require "json"
    puts "Importing import.json"
    file = File.open "import.json"
    data = JSON.load file
end


def anzeige(inventar)
    puts "Inventar"
    puts \
        "inventar: \
            #{inventar['tshirts']} tshirts\
            #{inventar['pullover']} pullover\
            #{inventar['hemden']} hemden\
            #{inventar['jacken']} jacken\
            #{inventar['hosen']} hosen\
        "
end
def hinzufügen(inventar)
    puts "Was darf's denn sein? Ich kann die Anzahl von tshirts, pullover, hemden, jacken und hosen ändern"
    choice = gets.strip
    puts "Ok, wir ändern die Anzahl von #{choice}. Um wieviele Elemente?"
    count = gets.strip.to_i
    operation = count > 1 ? "hinzugefügt" : "entfernt" 
    puts "Okese, #{count} #{choice} wurden #{operation}"
    new_count = inventar[choice] + count
    puts "Aus #{inventar[choice]} tshirts werden jetzt #{new_count}"
    inventar[choice] = new_count 
end

puts \
    "Hauptmenü. \n\
    1 - Inventar anzeigen \n\
    2 - Anzahl ändern 
    "
choice = gets.strip
case choice
when "1"
    anzeige import
when "2"
    hinzufügen import
end
