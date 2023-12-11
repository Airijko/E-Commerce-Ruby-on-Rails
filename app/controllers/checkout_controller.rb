class CheckoutController < ApplicationController
    def create
        @products = Product.find(session[:cart])

        if @product.nil?
            redirect_to root_path
            return
        end

        respond_to do |format|
            format.js
        end

    end

    def success

    end

    def cancel

    end
end
