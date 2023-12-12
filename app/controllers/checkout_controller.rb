class CheckoutController < ApplicationController
    def create
        @product = Product.find(session[:cart])

        if @product.nil?
            redirect_to root_path
            return
        end

        respond_to do |format|
            format.js
        end
            @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
                name: product.name,
                description: product.description,
                amount: product.price,
                currency: 'cad',
                quantity: 1
            }],
            success_url: checkout_success_url,
            cancel_url: checkout_cancel_url
        )

    end

    def success

    end

    def cancel

    end
end
