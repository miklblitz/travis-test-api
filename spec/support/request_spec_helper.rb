module RequestSpecHelper

  def json
    JSON.parse(response.body)
  end
  
  def page_size
    WillPaginate.per_page
  end
end