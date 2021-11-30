class CamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age  #my solution is the same but includes  :activities

  has_many :activities
end
