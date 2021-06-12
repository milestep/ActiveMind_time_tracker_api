class Project < ApplicationRecord
    has_many :notes, dependent: :destroy
    validates :project, presence: true, length: { minimum: 3 }
end
