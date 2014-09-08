require "rails_helper"

describe User do
  it {should validate_presence_of :email}
  it {should validate_presence_of :password_digest}
  it {should validate_uniqueness_of :email}
  it {should have_many :links}
  it {should have_many :votes}
  it {should have_many :comments}
end
