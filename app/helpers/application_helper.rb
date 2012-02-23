module ApplicationHelper
  def category_tree
    tree = '<ul>'
    categories = Category.where('parent_id == 1')
    categories.each do |c|
      tree << "<li>#{link_to c.name, :controller => 'products', :action => 'index', :category => c.id}</li>"
      tree << append_child_categories(c) unless c.subcategories.nil?
    end
    tree << '</ul>'
    sanitize (tree)
  end

  def notice_message
    flash_messages = []

    flash.each do |type, message|
      type = :success if type == :notice
      text = content_tag(:div, link_to("x", "#", :class => "close") + message, :class => "alert-message #{type}")
      flash_messages << text if message
    end

    flash_messages.join("\n").html_safe
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
