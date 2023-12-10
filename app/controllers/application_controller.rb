class ApplicationController < ActionController::Base
    before_action :initizalize_session
    before_action :increment_visit_count
    before_action :load_cart

    def add_to_cart
        id = params[:id].to_i

        session[:cart] << id unless session[:cart].include?(id)
        redirect_to root_path
    end

    def remove_from_cart
        session[:cart].delete(params[:id].to_i)
        redirect_to root_path
    end

    private

    def initizalize_session
        session[:visit_count] ||= 0
        session[:cart] ||= []
    end

    def load_cart
        @cart = Product.find(session[:cart])
    end

    def increment_visit_count
        session[:visit_count] += 1
        @visit_count = session[:visit_count]
    end
end
