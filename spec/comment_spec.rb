require "rails_helper"

describe Comment do
  it {should validate_presence_of :opinion}
  it {should belong_to :commentable}
  it {should have_many :comments}
  it {should belong_to :user}
end
