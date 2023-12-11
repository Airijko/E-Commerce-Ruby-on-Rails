class CheckoutController < ApplicationController
    def create
        @product = Product.find(session[:cart])

        if @product.nil?
            redirect_to root_path
            return
        end

        respond_to do |format|
            format.js
            format.html { redirect_to root_path }
        end

    end

    def success

    end

    def cancel

    end
end
