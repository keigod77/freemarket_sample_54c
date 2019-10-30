class Category < ApplicationRecord
  belongs_to :parent, class_name: :Category,optional: true
  has_many :children, class_name: :Category, foreign_key: :parent_id

  def self.getParentCategoriesArray
    parent_category = Category.where(parent_id: nil)
    parent_name = parent_category.pluck(:name)
    return parent_name
  end
end