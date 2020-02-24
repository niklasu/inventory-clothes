class ImportExport
    def import
        require "json"
        puts "Importing import.json"
        file = File.open "import.json"
        JSON.load file
    end
    def to_import_structure items
        items.group_by{|item|item.category}.to_json
    end
    def export items
        File.open("export.json", "w") do |f|
            f.write(to_import_structure items)
        end
    end
end
