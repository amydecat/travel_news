class Comment < ActiveRecord::Base
  validates :link_id, :presence => true
  validates :opinion, :presence => true

  belongs_to :link
end
