class PagesController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @pages = Page.all
  end

  def show
    
  end

  def new
    @page = Page.new  
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    password = @page.generate_password
    @page.password = @page.encode_password(password)
    if @page.save
      redirect_to @page, notice: "Your password #{password} for editing"
    else
      render :new
    end
      
  end
  def update
    if @page.check_password?(password_params[:password])
      if @page.update(page_params)
        redirect_to @page, notice: "Successful"
      else
        render :edit, notice: "brrrr"
      end
    else
      render :show
    end
  end

  private 

  def set_product
    @page = Page.friendly.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :data)
  end

  def password_params
    params.require(:page).permit(:password)
  end
  
end
