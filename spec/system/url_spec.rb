require "rails_helper"

RSpec.describe "URL Management", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "creating a short link" do
    before(:each) do
      visit "/"
    end

    context "given a valid uri" do
      let(:url) { "http://www.example.com" }

      it "works" do
        fill_in "URL", with: url
        click_button "Create"

        short_link = ShortLink.last

        within "li##{dom_id(short_link)}" do
          expect(page).to have_content(url)
          expect(page).to have_content(short_link.friendly_id)
        end
      end
    end
  end
end
