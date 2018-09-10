class List < ApplicationRecord
  belongs_to :board
  has_many :jobs
end
