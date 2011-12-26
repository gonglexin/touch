module ApplicationHelper
  def category_tree
    tree = '<ul>'
    categories = Category.where('parent_id == 1')
    categories.each do |c|
      #tree << "<li><a href='#{products_path}/category_id=#{c.id}'>#{c.name}</a></li>"
      tree << "<li>#{link_to c.name, :controller => 'products', :action => 'index', :category => c.id}</li>"
      tree << append_child_categories(c) unless c.subcategories.nil?
    end
    tree << '</ul>'
    sanitize (tree)
  end
  
  private
    def append_child_categories(category)
      child_tree = '<ul>'
      category.subcategories.each do |c|
        child_tree << "<li>#{c.name}</li>"
      end
      child_tree << '</ul>'
    end
end
