class Shop 
  include ActiveModel::Model
  def initialize(name, url, comment)
    @name = name
    @url = url
    @comment = comment
  end
  attr_reader:name
  attr_reader:url
  attr_reader:comment
end
