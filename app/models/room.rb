class Room < ApplicationRecord
  has_many :videos, dependent: :destroy
end
