class PagesController < ApplicationController
  def index
    if params[:category]
      category = Category.find(params[:category])
      categories = []
      categories << category
      category.subcategories.each do |child_c|
        categories << child_c
      end
      @products = Product.where(:category_id => categories.collect { |c| c.id })
                         .paginate(:page => params[:page], :per_page => 6)
    else
      @products = Product.paginate(:page => params[:page], :per_page => 6)
    end
  end

end
