class ProductsController < ApplicationController
  before_action :set_product, only: :show

  # GET /products
  def index
    @products = Product.where(["end_date >= ?", Date.today])
    render json: @products
  end

  # GET /products/1
  def show
    if @product.expired?
      render json: {error: 'Product Expired.'}
    else
      render json: @product, include: 'rate_plans', :conditions => "end_date >= #{Date.today}"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:title, :description, :start_date, :end_date)
    end
end
