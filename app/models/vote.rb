class Vote < ActiveRecord::Base
  belongs_to :ballot
  belongs_to :candidate
end
