class Admin::CategoriesController < Admin::ApplicationController
  layout 'admin'

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
    @category = Category.find(params[:id])
    @parent = @category.parent
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      @parent = @category.parent
      redirect_to admin_category_path(@category), notice: 'Category was successfully created.'
    else
      @parent = @category.parent
      render action: "new"
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      @parent = @category.parent
      redirect_to admin_category_path(@category), notice: 'Category was successfully updated.'
    else
      @parent = @category.parent
      render action: "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @parent = @category.parent
    @category.destroy
    redirect_to admin_categories_url
  end

end
