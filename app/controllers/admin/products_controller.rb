class Admin::ProductsController < Admin::ApplicationController

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

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to admin_product_path(@product), notice: 'Product was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      redirect_to admin_product_path(@product), notice: 'Product was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_url
  end
end
