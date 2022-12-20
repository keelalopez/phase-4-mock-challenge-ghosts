class GhostShowSerializer < ActiveModel::Serializer
  attributes :id

  has_many :haunted_houses
end
