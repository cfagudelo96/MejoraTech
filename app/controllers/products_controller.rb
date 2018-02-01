class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :restrict_access_to_admin

  def index
    @products = Product.all
    apply_filters
    @products = @products.paginate(page: params[:page])
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: t('.success') }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: t('.success') }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private

  def apply_filters
    return if params[:value].blank?
    if params[:filter] == 'name'
      @products = @products.by_name(params[:value])
    elsif params[:filter] == 'code'
      @products = @products.by_code(params[:value])
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:code, :name)
  end
end
