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
  end
end
