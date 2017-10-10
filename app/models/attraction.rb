class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides
  validates_presence_of :name, :min_height, :tickets, :happiness_rating, :nausea_rating
end
