def import
    require "json"
    puts "Importing import.json"
    file = File.open "import.json"
    data = JSON.load file
end


def anzeige(inventar)
    puts "Inventar"
    puts \
        "inventar: \
            #{inventar['tshirts']} tshirts\
            #{inventar['pullover']} pullover\
            #{inventar['hemden']} hemden\
            #{inventar['jacken']} jacken\
            #{inventar['hosen']} hosen\
        "
end
def hinzufügen(inventar)
    puts "Was darf's denn sein? Ich kann tshirts, pullover, hemden, jacken und hosen hinzufügen"
    choice = gets.strip
    puts "Ok, wir fügen #{choice} hinzu. Wieviele denn?"
    count = gets.strip
    puts "Okese, #{count} #{choice} wurden hinzugefügt"
    current_count = inventar.each{|group| group.find{|clothing| puts "Iterating... #{clothing}"}}
end

puts "Hauptmenü. \n1 - Inventar anzeigen \n2 - Kleidung hinzufügen"
choice = gets.strip
case choice
when "1"
    anzeige import
when "2"
    hinzufügen import
end
