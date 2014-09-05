class Link < ActiveRecord::Base
  validates :headline, :presence => true
  validates :website, :presence => true

  has_many :votes
  has_many :comments
  # has_many :comments, :as => :commentable

  def self.sorted_links
    @links = Link.all.sort_by{|link| link.tally}.reverse
    @today_links = []
    @other_day_links = []
    @links.each do |link|
      if link.created_at.to_date == Date.today
        @today_links << link
      else
        @other_day_links << link
      end
    end
    @sorted_links = @today_links + @other_day_links
    @sorted_links
  end
end
