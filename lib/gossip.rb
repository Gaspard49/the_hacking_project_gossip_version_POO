require 'csv'

class Gossip
  attr_accessor :content, :author

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("db/gossip.csv", "a") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.foreach("db/gossip.csv") do |row|
      all_gossips << Gossip.new(row[0], row[1])
    end
    return all_gossips
  end 

  
  def self.delete_gossip(number)
    arraycsv = CSV.read('db/gossip.csv', {col_sep: ","})
    newcsv = arraycsv.delete_at(number)
    puts "Gossip n.#{number}  deleted"
    puts "Press enter to go to the menu"
    gets.chomp
    CSV.open('db/gossip.csv', "w") do |csv|
        arraycsv.each do |gossip|
            csv << gossip
        end
    end
end

end
