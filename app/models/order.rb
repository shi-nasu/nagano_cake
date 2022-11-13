class Order < ApplicationRecord

  enum payment_method: { waiting_payment: 0, payment_confirmation: 1, production: 2, preparation: 3, shipped: 4}
  
  has_many :order_details
  belongs_to :customer
  
end