class Category < ApplicationRecord
  belongs_to :parent, class_name: :Category
  has_many :children, class_name: :Category, foreign_key: :parent_id

  def self.getParentCategoriesArray
    parent_category = Category.where(parent_id: nil)
    parent_name = []
    for i in parent_category do
      parent_name << i.name
    end
    return parent_name
  end
end