class Vote < ActiveRecord::Base
  validates :like, presence: true

  belongs_to :link
end
