class Link < ActiveRecord::Base
  validates :headline, :presence => true
  validates :website, :presence => true
end
