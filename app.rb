class ItemRepository
 @items = Hash.new
 
 def initialize(import_items)
    @items=import_items
    puts "init done. got #{@items.count} items"
 end

 def getAll()
     @items
 end
 
 def findByName(name)
    @items.find{|item|
        if item["Product"] == name 
            item
        end
    }   
 end
 def add(item)
    @items << item 
 end
end
 
def add()
    puts "Name?"
    name = gets.strip
    puts "Anzahl?"
    count = gets.strip.to_i
    puts "Beschreibung?"
    description = gets.strip
    puts "Kategorie?"
    category= gets.strip
    product = Hash.new
    product["Product"] = name
    product["Anzahl"] = count 
    product["Anmerkung"] = description 
    product["Kategorie"] = category 
    $itemRepository.add product
end

def import
    require "json"
    puts "Importing import.json"
    file = File.open "import.json"
    $inventar= JSON.load file
end

def anzeige()
    $itemRepository.getAll.each{|item|
        puts "#{item['Anzahl']}x #{item['Product']} - #{item['Anmerkung']}"
    }
end

def to_import_structure
    $itemRepository.getAll.group_by{|item|item["Kategorie"]}.to_json
end
def export()
    File.open("export.json", "w") do |f|
        f.write(to_import_structure)
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
    item = $itemRepository.findByName choice
    item["Anmerkung"] = new_description
    puts "Aktualisiertes Produkt: #{item}"
end

def anzahl_ändern()
    puts "Welches Produkt soll bearbeitet werden?"
    choice = gets.strip
    puts "Ok, #{choice} wird bearbeitet. Neue Anzahl?"
    new_count = gets.strip.to_i
    item = $itemRepository.findByName choice
    item["Anzahl"] = new_count
    puts "Aktualisiertes Produkt: #{item}"
end

import
$itemRepository = ItemRepository.new flatten_inventory
loop do
    puts \
    "Hauptmenü\n\
    0 - Anwendung schließen \n\
    1 - Inventar anzeigen \n\
    2 - Anmerkung bearbeiten\n\
    3 - Inventar exportieren\n\
    4 - Element hinzufügen\n\
    5 - Anzahl ändern
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
        add 
    when "5"
        anzahl_ändern
    end
break if choice == "0"
end
