require "rails_helper"

describe Comment do
  it {should validate_presence_of :opinion}
  it {should validate_presence_of :link_id}
  it {should belong_to :link}
  it {should belong_to :commentable}
  it {should have_many :comments}
end
