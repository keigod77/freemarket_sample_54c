FactoryBot.define do
  factory :image do
    id {1}
    item_id {1}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
  end
end
