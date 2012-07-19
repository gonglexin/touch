class PagesController < ApplicationController
  def index
    @products = Product.first(8)
  end

  def about
    @content = Content.where(:page_name => 'about')[0]
    render :layout => 'page'
  end

  def contact
    @content = Content.where(:page_name => 'contact')[0]
    render :layout => 'page'
  end

end
