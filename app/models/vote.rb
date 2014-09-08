class Vote < ActiveRecord::Base
  belongs_to :link
  belongs_to :user

  scope :votes_for_link, -> (link) { where(link_id: link.id) }
end
