class GhostShowSerializer < ActiveModel::Serializer
  attributes :id, :address

  has_many :hauntings
end
