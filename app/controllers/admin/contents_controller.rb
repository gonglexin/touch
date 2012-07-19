class Admin::ContentsController < Admin::ApplicationController

  def about
    @content = Content.where(:page_name => 'about')[0]
    render 'edit'
  end

  def contact
    @content = Content.where(:page_name => 'contact')[0]
    render 'edit'
  end

  def update
    @content = Content.find(params[:id])
    if @content.update_attributes(params[:content])
      if @content.page_name == 'about'
        redirect_to admin_about_path, :notice => 'Content was successfully updated.'
      else
        redirect_to admin_contact_path, :notice => 'Content was successfully updated.'
      end
    else
      render 'edit'
    end
  end
end
