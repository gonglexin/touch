class PagesController < ApplicationController
  def index
    @products = Product.first(8)
  end

  def about
    @content = Content.find_by_page_name('about')
    render :layout => 'page'
  end

  def contact
    @content = Content.find_by_page_name('contact')
    render :layout => 'page'
  end

end
