class Tool < ApplicationRecord
  belongs_to :user
  validates :tool_name , presence:true
end
