class Admin::CategoriesController < Admin::ApplicationController

  def index
    if (params[:id])
      @parent = Category.find(params[:id])
      @categories = Category.find_all_by_parent_id(params[:id])
    else
      @categories = Category.find_all_by_parent_id(1)
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
    puts "==>>>>>"
    p params[:category]
    p @category 
    puts "==>>>>>"

    if @category.save
      redirect_to admin_category_path(@category), notice: 'Category was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to admin_category_path(@category), notice: 'Category was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_categories_url
  end

end
