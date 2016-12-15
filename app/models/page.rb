class Page < ApplicationRecord
  serialize :h1, Array
  serialize :h2, Array
  serialize :h3, Array

  validates :title, presence: true
  validates :url, presence: true
end
