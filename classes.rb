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
end

class Product
    attr_accessor :name, :count, :description, :category

    def initialize(name, count, description, category)
        @name = name
        @count = count
        @description = description
        @category = category
    end
    def as_json(options={})
        {
        name: @name,
        count: @count,
        description: @description,
        category: @category
        }
    end
    def to_json(*options)
        as_json(*options).to_json(*options)
    end

#    def to_s
#        "#{@name} #{@count} #{@description} #{@category}"
#    end
end
