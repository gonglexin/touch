class Admin::ContentsController < Admin::ApplicationController
  layout 'admin'

  def about
    @content = Content.find_by_page_name('about')
    render 'edit'
  end

  def contact
    @content = Content.find_by_page_name('contact')
    render 'edit'
  end

  def update
    @content = Content.find(params[:id])
    if @content.update(params.require(:content).permit(:page_name, :body))
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
