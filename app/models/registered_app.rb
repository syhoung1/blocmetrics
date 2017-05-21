class RegisteredApp < ActiveRecord::Base
  belongs_to :user
  has_many :events
  validates :url, url: true, presence: true
end
