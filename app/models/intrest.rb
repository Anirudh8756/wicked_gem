class Intrest < ApplicationRecord
  belongs_to :user
  validates :intrest_name , presence: true
end
