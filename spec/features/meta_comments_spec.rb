require 'capybara/rails'

describe "commenting" do
  it "creates a new comment" do
    link = Link.create(id: 1, headline: 'Awesome trips', website: 'www.awesometrips.com', created_at: "2014-09-01 18:09:14.904763", tally: 5)
    visit "/links/#{link.id}"
    save_and_open_page
    fill_in "comment_opinion", :with => "This is a cool place"
    click_button 'Create Comment'
    page.should have_content 'Thanks for your comment!'
  end
end
