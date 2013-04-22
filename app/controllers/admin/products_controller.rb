class Admin::ProductsController < Admin::ApplicationController
  layout 'admin'
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.page(params[:page]).per_page(5)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_product_path(@product), notice: 'Product was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product), notice: 'Product was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @product.destroy

    redirect_to admin_products_url, notice: 'Product was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :category_id, :image, :image_cache)
    end
end
