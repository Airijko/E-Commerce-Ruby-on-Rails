class CheckoutController < ApplicationController
    def create
        products = []

        session[:cart].each do |item|
            product = Product.find(item)
            if !product.nil?
                products << { 
                    price_data: {
                        product_data: {
                            name: product.name,
                            description: product.description
                        },
                        unit_amount: (product.price * 100).to_i,
                        currency: 'cad',
                    },
                    quantity: 1
                }
            end
        end
        
        if products.empty?
            redirect_to root_path
            return
        end
        
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: products,
            mode: 'payment',
            success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
            cancel_url: checkout_cancel_url
        )

        respond_to do |format|
            format.js
        end
    end

    def success
        @session = Stripe::Checkout::Session.retrieve(params[:session_id])
        @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
        session[:cart] = []
    end

    def cancel
        redirect_to root_path
    end
end