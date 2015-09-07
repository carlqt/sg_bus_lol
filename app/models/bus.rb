class Bus < ActiveRecord::Base
  validates :number, uniqueness: true
end
