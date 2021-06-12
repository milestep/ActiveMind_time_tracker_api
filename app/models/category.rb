class Category < ApplicationRecord
    has_many :notes, dependent: :destroy
    validates :category, presence: true, length: { minimum: 3 }
end
