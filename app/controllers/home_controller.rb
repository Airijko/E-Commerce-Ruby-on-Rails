class HomeController < ApplicationController
  def index
    @categories = Category.all.pluck(:name)
    @filtered_products = filter_products(params).page(params[:page]).per(20)
  end

  private

  def filter_products(params)
    products = Product.all

    if params[:search].present?
      products = products.where("products.name LIKE ?", "%#{params[:search]}%")
    end

    if params[:min_price].present?
      products = products.where("price >= ?", params[:min_price])
    end

    if params[:max_price].present?
      products = products.where("price <= ?", params[:max_price])
    end

    if params[:recently_modified].present?
      products = products.where("updated_at >= ?", 3.days.ago)
    end

    if params[:recently_created].present?
      products = products.where("created_at >= ?", 3.days.ago)
    end

    if params[:on_sale].present?
      products = products.where(on_sale: true)
    end

    if params[:category].present? && params[:category] != 'Select a category'
      products = products.joins(:category).where(categories: { name: params[:category] })
    end

    products
  end
end