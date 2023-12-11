class HomeController < ApplicationController
  def index
    @categories = Category.all.pluck(:name)
    @filtered_products = filter_products(params).page(params[:page]).per(20)
  end

  private

  def filter_products(params)
    products = Product.all

    if params[:search].present?
      products = products.where("name LIKE ?", "%#{params[:search]}%")
    end

    if params[:min_price].present?
      products = products.where("price >= ?", params[:min_price])
    end

    if params[:start_date].present?
      products = products.where("products.created_at >= ?", params[:start_date])
    end

    if params[:end_date].present?
      products = products.where("products.created_at <= ?", params[:end_date])
    end

    if params[:category].present?
      products = products.joins(:category).where(categories: { name: params[:category] })
    end

    products
  end
end