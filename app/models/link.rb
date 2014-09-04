class Link < ActiveRecord::Base
  validates :headline, :presence => true
  validates :website, :presence => true

  has_many :votes
  has_many :comments
end
