class Brand < ApplicationRecord
  has_many :items

  def self.getBrandNamesArray
    brand_name = []
    for i in Brand.all do
      brand_name << i.name
    end
    return brand_name
  end
end
