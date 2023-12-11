class HomeController < ApplicationController
  def index
    @filtered_products = filter_products(params[:search]).page(params[:page]).per(20)
  end

  def filter_products(search_term)
    if search_term.present?
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      Product.all
    end
  end
end
