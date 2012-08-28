class ProductsController < ApplicationController
  layout 'products'

  def index
    if params[:category]
      category = Category.find(params[:category])
      categories = []
      categories << category
      category.subcategories.each do |child_c|
        categories << child_c
      end
      @products = Product.where(:category_id => categories.collect(&:id))
                         .page(params[:page]).per_page(8)
    else
      @products = Product.page(params[:page]).per_page(8)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
end
