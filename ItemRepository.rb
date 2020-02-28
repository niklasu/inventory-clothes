class ItemRepository
 @items = [] 
 
 def initialize(import_items)
    @items=import_items
    puts "init done. got #{@items.count} items"
 end

 def getAll()
     @items
 end
 
 def findByName(name)
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
