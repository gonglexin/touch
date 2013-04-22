class Admin::CategoriesController < Admin::ApplicationController
  layout 'admin'
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    if (params[:id])
      @parent = Category.find(params[:id])
      @categories = Category.find_all_by_parent_id(params[:id]).reverse
    else
      @categories = Category.find_all_by_parent_id(1).reverse
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @parent = Category.find(params[:parent]) if params[:parent]
    @category = Category.new
  end

  def edit
    @parent = @category.parent
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      @parent = @category.parent
      redirect_to admin_category_path(@category), notice: 'Category was successfully created.'
    else
      @parent = @category.parent
      render action: "new"
    end
  end

  def update
    if @category.update(category_params)
      @parent = @category.parent
      redirect_to admin_category_path(@category), notice: 'Category was successfully updated.'
    else
      @parent = @category.parent
      render action: "edit"
    end
  end

  def destroy
    @parent = @category.parent
    @category.destroy
    redirect_to admin_categories_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :parent, :parent_id)
    end

end
