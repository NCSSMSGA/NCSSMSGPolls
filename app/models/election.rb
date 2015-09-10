class Election < ActiveRecord::Base
  before_save :convertYears
  before_update :convertYears
  has_many :candidates, dependent: :destroy
  has_many :ballots, dependent: :destroy
  has_many :votes, through: :ballots
  validates :name, uniqueness: :true

  serialize :years

  def open?
    return true if self.start < Time.now and self.end > Time.now
  end

  private

  def convertYears
    self.years = (self.years - [""]).map(&:to_i)
  end
end
