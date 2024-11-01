class Project < ApplicationRecord
  belongs_to :user
  validates :name , :detail , presence: true
end
