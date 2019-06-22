class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  WillPaginate.per_page = 10
end
