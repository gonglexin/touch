class ProductsController < ApplicationController

  # GET /products
  # GET /products.json
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
      @products = Product.page(params[:page]).per_page(6)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
end
