require 'controller'

class Router
  attr_accessor :controller

  def initialize 
    @controller = Controller.new #c'est une manière pour le routeur d'exécuter une méthode située dans une autre classe : en faisant @controller.create_gossip, le routeur passe la main à la classe Controller en exécutant sa méthode create_gossip.
  end

  def perform
    puts "WELCOME TO THE GOSSIP PROJECT"
    while true
system 'clear'
      puts "What do you want to do?"
      puts "1- Create a gossip"
      puts "2- See all gossips"
      puts "3- Delete a gossip"
      puts "4- Exit"
      print ">"
      params = gets.chomp.to_i
system 'clear'
      case params
      when 1
        puts "You choose to create a gossip"
        @controller.create_gossip
        system 'clear'
        puts "Gossip created!"
      when 2
        puts "You choose to see all gossips"
        @controller.index_gossips
        puts "Press enter to leave"
        gets
        system 'clear'
      when 3
	    	puts "You choose to delete a gossip"
        @controller.delete_gossip
        system 'clear'
        puts "Gossip deleted!"
      when 4
        puts "See you soon!"  #Ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.
        break
      else
        puts "Wrong choice, please try again."
      end
    end
  end
end