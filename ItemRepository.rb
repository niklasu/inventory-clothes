class ItemRepository
 @items = [] 
 
 def initialize(import_items)
    @items=import_items
    puts "init done. got #{@items.count} items"
 end

 def get_all()
     @items
 end
 
 def find_by_name(name)
    @items.find{|item|
        if item.name ==  name 
            item
        end
    }   
 end
 def add(item)
    @items << item 
 end
 def remove item
     @items.delete item
 end

end
