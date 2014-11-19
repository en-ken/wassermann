class Shop 
  include ActiveModel::Model
  def initialize(name, url, comment, img_url, keyword)
    @name = name
    @url = url
    @comment = comment
    @img_url = img_url
    @keyword = keyword
  end

  attr_reader:name
  attr_reader:url
  attr_reader:comment
  attr_reader:img_url
  attr_reader:keyword
end
