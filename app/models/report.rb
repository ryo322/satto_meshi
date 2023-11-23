class Report < ApplicationRecord
  belongs_to :reporter, class_name: "User"
  belongs_to :reported, class_name: "Post"
  
  validates :reason, presence: true
  
  scope :unconfirmed, -> { where(confirmed: false) }
end
