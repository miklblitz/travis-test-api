class GoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price
end
