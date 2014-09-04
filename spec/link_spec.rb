require 'rails_helper'

describe Link do
  it {should validate_presence_of :headline}
  it {should validate_presence_of :website}
end
