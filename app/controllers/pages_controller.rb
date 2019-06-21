class PagesController < ApplicationController
  def welcome
    render json: [message: "welcome to API"]
  end
end
