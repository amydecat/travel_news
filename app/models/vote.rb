class Vote < ActiveRecord::Base
  belongs_to :link

  scope :votes_for_link, -> (link) { where(link_id: link.id) }
end
