require_relative 'Product.rb'
require_relative 'import_export.rb'
require_relative 'ItemRepository.rb'
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

def print()
    $itemRepository.get_all.each{|item|
        puts "#{item.count}x #{item.name} - #{item.description}"
    }
end

def flatten_inventory inventory
    flat_items = inventory.map{|category, items|
        items.map{|item| 
            item['category'] = category
            item
        } 
    }.flatten
end

def change_description()
    puts "Welches Produkt soll bearbeitet werden?"
    choice = gets.strip
    puts "Ok, #{choice} wird bearbeitet. Neue Beschreibung?"
    new_description = gets.strip
    item = $itemRepository.find_by_name choice
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
    item = $itemRepository.find_by_name choice
    item.count = new_count
    puts "Aktualisiertes Produkt: #{item}"
end
def remove 
    puts "Welches Produkt soll entfernt werden?"
    choice = gets.strip
    item = $itemRepository.find_by_name choice
    if item.nil?
        puts "#{choice} wurde nicht gefunden"
    else 
        $itemRepository.remove item
        puts "#{item} wurde entfernt"
    end
end
def to_types(flat_items)
    flat_items.map{|item| 
        Product.new item['name'], item['count'], item['description'],  item['category'] }
end
$importExport = ImportExport.new
$itemRepository = ItemRepository.new to_types flatten_inventory $importExport.import 
loop do
    puts \
    "Hauptmenü\n\
    0 - Anwendung schließen \n\
    1 - Inventar anzeigen \n\
    2 - Anmerkung bearbeiten\n\
    3 - Inventar exportieren\n\
    4 - Element hinzufügen\n\
    5 - Anzahl ändern\n\
    6 - Element entfernen
    "
    choice = gets.strip
    case choice
    when "1"
        print 
    when "2"
        change_description
    when "3"
        $importExport.export $itemRepository.get_all 
    when "4"
        add 
    when "5"
        change_count
    when "6"
        remove 
    end
break if choice == "0"
end
