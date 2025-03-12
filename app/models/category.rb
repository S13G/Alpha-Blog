# frozen_string_literal: true
class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20, minimum: 5 }
  validates_uniqueness_of :name
  has_many :article_categories
  has_many :articles, through: :article_categories
end
