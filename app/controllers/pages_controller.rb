class PagesController < ApplicationController
  def welcome
    render json: [message: "welcome to API v1.0.2"]
  end
end
