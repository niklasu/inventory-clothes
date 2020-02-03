def import
    require "json"
    puts "Importing import.json"
    file = File.open "import.json"
    $inventar= JSON.load file
end

def anzeige()
    puts \
        "Inventar: 
        #{$inventar['tshirts']} Tshirts
        #{$inventar['pullover']} Pullover
        #{$inventar['hemden']} Hemden
        #{$inventar['jacken']} Jacken
        #{$inventar['hosen']} Hosen
        "
end

def anzahl_ändern()
    puts "Was darf's denn sein? Ich kann die Anzahl von Tshirts, Pullover, Hemden, Jacken und Hosen ändern"
    choice = gets.strip
    puts "Ok, wir ändern die Anzahl von #{choice}. Um wieviele Elemente?"
    count = gets.strip.to_i
    operation = count >= 1 ? "hinzugefügt" : "entfernt" 
    puts "Okese, #{count} #{choice} wurden #{operation}"
    new_count = $inventar[choice] + count
    puts "Aus #{$inventar[choice]} #{choice} werden jetzt #{new_count}"
    $inventar[choice] = new_count 
end

def suche()
    puts "Wonach suchen wir denn?"
    search_term = gets.strip
    result = $inventar.select{|key, hash| key.include? search_term}
    puts result
end

def export()
    File.open("export.json", "w") do |f|
        f.write($inventar.to_json)
    end
end

import
loop do
    puts \
    "Hauptmenü\n\
    0 - Anwendung schließen \n\
    1 - Inventar anzeigen \n\
    2 - Anzahl ändern\n\
    3 - Inventar durchsuchen\n\
    4 - Inventar exportieren
    "
    choice = gets.strip
    case choice
    when "1"
        anzeige 
    when "2"
        anzahl_ändern 
    when "3"
        suche
    when "4"
        export
    end
break if choice == "0"
end
