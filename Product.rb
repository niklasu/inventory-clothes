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
 def ==(other)
     self.name == other.name &&
     self.count == other.count &&
     self.description == other.description &&
     self.category == other.category
 end

     def to_s
         "#{@name} #{@count} #{@description} #{@category}"
     end
end
