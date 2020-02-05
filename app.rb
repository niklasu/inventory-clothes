def import
    require "json"
    puts "Importing import.json"
    file = File.open "import.json"
    $inventar= JSON.load file
end

def anzeige()
    $items.each{|item|
        puts "#{item['Anzahl']}x #{item['Produkt']} - #{item['Anmerkung']}"
    }
end

def export()
    File.open("export.json", "w") do |f|
        f.write($inventar.to_json)
    end
end
def flatten_inventory
    flat_items = $inventar.map{|kategorie, items|
        items.map{|item| 
            item["Kategorie"] = kategorie
            item
        } 
    }.flatten
end

def bearbeiten()
    puts "Welches Produkt soll bearbeitet werden?"
    choice = gets.strip
    puts "Ok, #{choice} wird bearbeitet. Neue Beschreibung?"
    new_description = gets.strip
    $items.find{|item|
        if item["Produkt"] == choice
            item["Anmerkung"] = new_description
            puts "Aktualisiertes Produkt: #{item}"
            item
        end
    }
end
def init_items()
    $items = flatten_inventory
end

def anzahl_ändern()
    puts "Welches Produkt soll bearbeitet werden?"
    choice = gets.strip
    puts "Ok, #{choice} wird bearbeitet. Neue Anzahl?"
    new_count = gets.strip.to_i
    $items.find{|item|
        if item["Produkt"] == choice
            item["Anzahl"] = new_count
            puts "Aktualisiertes Produkt: #{item}"
            item
        end
    }
    
end
import
init_items
loop do
    puts \
    "Hauptmenü\n\
    0 - Anwendung schließen \n\
    1 - Inventar anzeigen \n\
    2 - Anmerkung bearbeiten\n\
    3 - Inventar exportieren\n\
    4 - Anzahl ändern
    "
    choice = gets.strip
    case choice
    when "1"
        anzeige 
    when "2"
        bearbeiten
    when "3"
        export
    when "4"
        anzahl_ändern
    end
break if choice == "0"
end
