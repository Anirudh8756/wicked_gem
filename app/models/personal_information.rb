class PersonalInformation < ApplicationRecord
  belongs_to :user
  validates :name, :email , :contact_no , :address , presence: true
end
