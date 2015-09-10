class Ballot < ActiveRecord::Base
  belongs_to :user
  belongs_to :election

  has_many :votes,  dependent: :destroy
  accepts_nested_attributes_for :votes, reject_if: :all_blank
end
