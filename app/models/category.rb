class Category < ApplicationRecord
  belongs_to :parent, class_name: :Category,optional: true
  has_many :children, class_name: :Category, foreign_key: :parent_id

  def self.getParentCategoriesArray
    parent_category = Category.where(parent_id: nil)
    parent_name = []
    for i in parent_category do
      parent_name << i.name
    end
    return parent_name
  end
  
  enum grandchildcategory: {
    美容機器: 1000
    # テストレディース孫1:1,テストレディース孫2:2
  }
end