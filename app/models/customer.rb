class Customer < ApplicationRecord

  validates :name, :phone, :description, presence: true

end
