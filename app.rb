def import
    require "json"
    puts "Importing import.json"
    file = File.open "import.json"
    $inventar= JSON.load file
end


def anzeige()
    puts "Inventar"
    puts \
        "inventar: \
            #{$inventar['tshirts']} tshirts\
            #{$inventar['pullover']} pullover\
            #{$inventar['hemden']} hemden\
            #{$inventar['jacken']} jacken\
            #{$inventar['hosen']} hosen\
        "
end
def hinzufügen()
    puts "Was darf's denn sein? Ich kann die Anzahl von Tshirts, Pullover, Hemden, Jacken und Hosen ändern"
    choice = gets.strip
    puts "Ok, wir ändern die Anzahl von #{choice}. Um wieviele Elemente?"
    count = gets.strip.to_i
    operation = count > 1 ? "hinzugefügt" : "entfernt" 
    puts "Okese, #{count} #{choice} wurden #{operation}"
    new_count = $inventar[choice] + count
    puts "Aus #{$inventar[choice]} #{choice} werden jetzt #{new_count}"
    $inventar[choice] = new_count 
end

import
loop do
    puts \
    "Hauptmenü. \n\
    1 - Inventar anzeigen \n\
    2 - Anzahl ändern\
    "
    choice = gets.strip
    case choice
    when "1"
    anzeige 
    when "2"
    hinzufügen 
    end
break if choice == "0"
end
