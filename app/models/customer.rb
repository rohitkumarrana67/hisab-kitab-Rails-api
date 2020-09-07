class Customer < ApplicationRecord
    belongs_to :user
    has_many :transaction, dependent: :destroy
end
