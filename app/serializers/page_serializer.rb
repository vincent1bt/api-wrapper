class PageSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :h1, :h2, :h3
end
