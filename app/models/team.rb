class Team < ActiveRecord::Base
  has_many :players
  belongs_to :user
  validates :name, :roster_size, presence: true
end