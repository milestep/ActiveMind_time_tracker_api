class Project < ApplicationRecord
    has_many :notes, dependent: :destroy
end
