class Comment < ActiveRecord::Base
  validates :link_id, :presence => true
  validates :opinion, :presence => true
  belongs_to :link
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
end
