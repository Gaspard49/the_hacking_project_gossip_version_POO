class View

  def create_gossip
    puts ("What is your name?")
    print (">")
    get_author = gets.chomp
    puts("What is your gossip?")
    print (">")
    get_content = gets.chomp
    return params = { content: get_content, author: get_author}
end

  def index_gossips(gossips)
    gossips.each do |row|
      puts "#{row.author} said : #{row.content}"
    end
  end

  def delete_gossip
    filtre_gossip = Gossip.all.each_with_index {|gossip, i| 
    puts "#{i} :  #{gossip.author},#{gossip.content}"}
    puts "Type the number of the gossip to delete"
    print ">"
    number = gets.chomp.to_i
    return number
end
end