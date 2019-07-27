require 'gossip'
require 'view'
require 'csv'

class Controller
  attr_accessor :view

  def initialize
    @view = View.new
  end

  def create_gossip
   params = @view.create_gossip
   my_gossip = Gossip.new(params[:author], params[:content])
   my_gossip.save
  end

  def index_gossips
    params = @view.index_gossips(Gossip.all)
  end

  	def delete_gossip
		number = @view.delete_gossip
		Gossip.delete_gossip(number)
	end
  
  
end