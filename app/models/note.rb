class Note < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :category
end
