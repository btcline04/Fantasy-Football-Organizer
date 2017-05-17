class Player < ActiveRecord::Base
  belongs_to :team
  validates :name, :number, :position, presence: true
end