class AboutsController < ApplicationController
  def index
    @about = About.all
  end
end