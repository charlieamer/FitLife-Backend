class UserPreference < ApplicationRecord
  belongs_to :user
  validates_presence_of :user, :calories, :protein, :fats, :carbs
  validates :calories, :numericality => { :greater_than_or_equal_to => 0 }
  validates :protein, :numericality => { :greater_than_or_equal_to => 0 }
  validates :fats, :numericality => { :greater_than_or_equal_to => 0 }
  validates :carbs, :numericality => { :greater_than_or_equal_to => 0 }
end
