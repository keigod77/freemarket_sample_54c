class Category < ApplicationRecord
  belongs_to :parent, class_name: :Category,optional: true
  has_many :children, class_name: :Category, foreign_key: :parent_id

  def self.getParentCategoriesArray
    parent_category = Category.where(parent_id: nil)
    parent_name = parent_category.pluck(:name)
    return parent_name
  end

  def self.getChildrenCategoriesArray(search_id)
    children_category = Category.where(parent_id: search_id)
    children_name = children_category.pluck(:name,:id)
    return children_name
  end

  def self.getGrandchildrenCategoriesArray(search_id)
    grandchildren_category = Category.where(parent_id: search_id)
    grandchildren_name = grandchildren_category.pluck(:name,:id)
    return grandchildren_name
  end
  
  enum grandchildcategory: {
    美容機器: 1000
    # テストレディース孫1:1,テストレディース孫2:2
  }
end