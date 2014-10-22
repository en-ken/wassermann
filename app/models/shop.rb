class Shop 
  include ActiveModel::Model
  def initialize(name, url)
    @name = name
    @url = url
  end
  attr_reader:name
  attr_reader:url
end
