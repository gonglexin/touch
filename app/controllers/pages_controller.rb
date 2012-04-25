class PagesController < ApplicationController
  def index
    @products = Product.first(8)
  end

  def about
    render :layout => 'page'
  end

  def contact
    render :layout => 'page'
  end

end
