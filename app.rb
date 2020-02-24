require_relative 'classes.rb'
def add()
    puts "Name?"
    name = gets.strip
    puts "Anzahl?"
    count = gets.strip.to_i
    puts "Beschreibung?"
    description = gets.strip
    puts "Kategorie?"
    category= gets.strip
    product = Product.new name, count, description, category 
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
        puts "#{item.count}x #{item.name} - #{item.description}"
    }
end

def to_import_structure
    $itemRepository.getAll.group_by{|item|item.category}.to_json
end
def export()
    File.open("export.json", "w") do |f|
        f.write(to_import_structure)
    end
end
def flatten_inventory
    flat_items = $inventar.map{|category, items|
        items.map{|item| 
            item['category'] = category
            puts "flattened #{item}"
            item
        } 
    }.flatten
end

def change_description()
    puts "Welches Produkt soll bearbeitet werden?"
    choice = gets.strip
    puts "Ok, #{choice} wird bearbeitet. Neue Beschreibung?"
    new_description = gets.strip
    item = $itemRepository.findByName choice
    if item.nil?
        puts "#{choice} wurde nicht gefunden"
    else 
        item.description = new_description
        puts "Aktualisiertes Produkt: #{item}"
    end
end

def change_count()
    puts "Welches Produkt soll bearbeitet werden?"
    choice = gets.strip
    puts "Ok, #{choice} wird bearbeitet. Neue Anzahl?"
    new_count = gets.strip.to_i
    item = $itemRepository.findByName choice
    item.count = new_count
    puts "Aktualisiertes Produkt: #{item}"
end
def to_types(flat_items)
    flat_items.map{|item| 
        Product.new item['name'], item['count'], item['description'],  item['category'] }
end
import
typed_products = to_types flatten_inventory
$itemRepository = ItemRepository.new typed_products
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
        change_description
    when "3"
        export
    when "4"
        add 
    when "5"
        change_count
    end
break if choice == "0"
end
