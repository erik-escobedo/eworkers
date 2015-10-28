class Worker < ActiveRecord::Base
  devise :registerable

  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
end
