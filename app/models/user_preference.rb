class UserPreference < ApplicationRecord
  belongs_to :user
  validates_presence_of :user, :calories, :protein, :fats, :carbs
  validates :calories, :numericality => { :greater_than_or_equal_to => 1 }
  validates :protein, :numericality => { :greater_than_or_equal_to => 1 }
  validates :fats, :numericality => { :greater_than_or_equal_to => 1 }
  validates :carbs, :numericality => { :greater_than_or_equal_to => 1 }
end
