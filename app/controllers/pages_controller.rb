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

  private 

  def set_product
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :data)
  end
  
end
