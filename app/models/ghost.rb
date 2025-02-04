class Ghost < ApplicationRecord
    has_many :hauntings
    has_many :haunted_houses, through: :hauntings

    validates :age_at_death, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 110}
    validates_presence_of :name, :age_at_death
end
