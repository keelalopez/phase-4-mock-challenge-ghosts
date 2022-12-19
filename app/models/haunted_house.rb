class HauntedHouse < ApplicationRecord
    has_many :hauntings
    has_many :ghosts, through: :hauntings

    # validates :address, 

    # def addres_check
    #     test = self.address[0].to_i
    #     if test !== 0
    #         true
    #     end

    # end
end
