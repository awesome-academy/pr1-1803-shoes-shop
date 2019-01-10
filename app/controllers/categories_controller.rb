class CategoriesController < ApplicationController

  def index
    @products = Product.all
    @products = @products.search_name params[:search_name] if params[:search_name].present?
    @products = @products.search_category params[:category_id] if params[:category_id].present?
    @products = @products.paginate page: params[:page], per_page: 10
  end

  def show
    @category = Category.find_by id: params[:id]
    @products = @category.products
    if params[:search_name].present?
      @products = @products.search_name(params[:search_name])
    end

    if params[:category_id].present?
      @products = @products.search_category(params[:category_id])
    end

    if params[:min_price] && params[:max_price]
      @min_price = params[:min_price]
      @max_price = params[:max_price]
      @products = @products.min_max_price(@min_price, @max_price)
    end
    @products = @category.products.paginate page: params[:page], per_page: 10
  end
end
