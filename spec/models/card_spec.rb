require 'rails_helper'

# RSpec.describe Card do
#   describe 'create' do

#     #保存可能
#     it 'is valid with user_id, customer_id, card_id' do
#       card = build(:card)
#       card.valid?
#       expect(card).to be_valid
#     end

#     #保存不可(user_idなし)
#     it 'is invalid without a user_id' do
#       card = build(:card, user_id: nil)
#       card.valid?
#       expect(card.errors[:user_id]).to include "can't be blank"
#     end

#     #保存不可(customer_id)
#     it 'is valid without a customer_id' do
#       card = build(:card, customer_id: nil)
#       card.valid?
#       expect(card[:customer_id]).to include "can't be blank"
#     end

#     #保存不可(card_id)
#     it 'is valid without a card_id' do
#       card = build(:card, card_id: nil)
#       card.valid?
#       expect(card[:card_id]).to include "can't be blank"
#     end

#   end
# end
