class Brand < ApplicationRecord
  has_many :items

  def self.getBrandNamesArray
    return brand_name = Brand.pluck(:name)
  end
end
