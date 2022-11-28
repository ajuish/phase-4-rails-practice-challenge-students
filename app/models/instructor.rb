class Instructor < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
