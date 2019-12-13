class ProductsController < ApplicationController
  ## prevent changes for edit only shows of the product via before_action require
  before_action :require_signin, except: [:index, :show]
  ## Before action findproduct use for params[:id]
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  ## this will apply for require owner
  before_action :require_owner, only: [:edit, :update, :destroy]
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params) 
    @product.user = current_user #this can use for creation of existing product if not it will through an error user doesn't exist
    # @product.save
    # redirect_to root_path
    # @product = Product.find(params[:id])
    if @product.save
      flash[:notice] = 'Product Successfully created'
      redirect_to root_path
    else
      flash[:alert] = 'Product cannot be created'
      render :new
    end
  end

  def show
    #fail
    @comment = @product.comments.build # automatically assign to comment object create comment object in memory
    @comments = @product.comments
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Product Successfully updated'
      redirect_to root_path
    else
      #flash.now is to solve the problem that it will not show to other 
      flash.now[:alert] = 'Product cannot be updated'
      render :edit
    end
  end

  def destroy
   
    @product.destroy
    redirect_to root_path
  end

  private

  #this will prevent to edit to compare to current_by owner
  def require_owner
    unless @product.owned_by?(current_user)
      flash[:alert] = "Access denied"
      redirect_to root_path
    end
  end

  def find_product
    ## to retrieve if exist if not redirecto to path
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end

  def product_params
    params.require(:product).permit(
      :name, :price, :description, :image_url, :quantity
    )
  end

end
