module ApplicationHelper
  def category_tree
    tree = '<ul class="nav nav-list">'
    categories = Category.where(:parent_id => 1)
    tree << content_tag('li', link_to('All Products', products_path), :class => 'nav-header active')
    categories.each do |c|
      tree << content_tag('li',
                          link_to(c.name,
                                  { :controller => 'products', :action => 'index', :category => c.id },
                                  :class => "#{'active' if current_page?(category: c.id)}"),
                          :class => 'nav-header')
      tree << append_child_categories(c) unless c.subcategories.nil?
    end
    tree << '</ul>'
    sanitize (tree)
  end

  def categories_selector(form)
    form.select :category_id, Category.all.collect { |c| [c.name, c.id] if c.name != 'root' }
  end

  private
    def append_child_categories(category)
      child_tree = '<ul class="nav nav-list">'
      category.subcategories.each do |c|
        child_tree << content_tag('li',
                                  link_to(c.name,
                                          { :controller => 'products', :action => 'index', :category => c.id },
                                          :class => "#{'active' if current_page?(category: c.id)}")
                                 )
      end
      child_tree << '</ul>'
    end
end
