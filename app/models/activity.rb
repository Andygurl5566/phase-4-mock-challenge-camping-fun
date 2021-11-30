class Activity < ApplicationRecord
    has_many :signups, dependent: :destroy #<----- solution for deleting signups when activity is deleted
    has_many :campers, through: :signups
end
