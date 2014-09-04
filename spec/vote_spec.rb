require 'rails_helper'

describe Vote do
  it {should validate_presence_of :like}
  it {should belong_to :link}
end
