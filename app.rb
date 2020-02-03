def import
    require "json"
    puts "Importing import.json"
    file = File.open "import.json"
    $inventar= JSON.load file
end

def anzeige()
    $inventar.each{|kategorie, items|
        puts "#{kategorie}"
        items.each{ |item| puts \
                  "#{item['Anzahl']}x #{item['Produkt']} - #{item['Anmerkung']}"
        }
    }
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
    3 - Inventar exportieren
    "
    choice = gets.strip
    case choice
    when "1"
        anzeige 
    when "3"
        export
    end
break if choice == "0"
end
