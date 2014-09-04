require 'rails_helper'

describe Vote do
  it {should belong_to :link}

  it 'should return all votes associated with a specific link' do
    link = Link.create(headline: 'Life Rocks!', website: 'liferocks.com')
    vote1 = Vote.create(link_id: link.id)
    vote2 = Vote.create(link_id: 5)
    vote3 = Vote.create(link_id: link.id)
    expect(Vote.votes_for_link(link)).to eq [vote1, vote3]
  end
end
