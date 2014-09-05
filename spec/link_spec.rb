require 'rails_helper'

describe Link do
  it {should validate_presence_of :headline}
  it {should validate_presence_of :website}
  it {should have_many :votes}
  it {should have_many :comments}
  # it {should have_many :comments, :as => :commentable}

  it 'should sort by tally with the older links appearing lower' do
    link1 = Link.create(headline: 'Awesome trips', website: 'www.awesometrips.com', created_at: "2014-09-01 18:09:14.904763", tally: 5)
    link2 = Link.create(headline: 'Bogus trips', website: 'www.bogustrips.com', created_at: "2014-09-01 18:09:14.904763", tally: 10)
    link3 = Link.create(headline: 'Meh trips', website: 'www.mehtrips.com', created_at: "2014-09-05 18:09:14.904763", tally: 1)
    expect(Link.sorted_links).to eq [link3, link2, link1]
  end
end
