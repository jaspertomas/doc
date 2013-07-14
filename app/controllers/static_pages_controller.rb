class StaticPagesController < ApplicationController
  def index
    redirect_to Topic.first
  end

  def help
  end

  def admin
  end

  def error
  end

  def initdb
    #create 2 states - Pending and Complete - for each Category
    if State.count==0
      Category.all.each do |c|
        State.create(name:"Pending", category_id:c.id, sort_order:0, is_default:true)
        State.create(name:"Complete", category_id:c.id, sort_order:99, is_default:false)
      end
    end
  end
end
