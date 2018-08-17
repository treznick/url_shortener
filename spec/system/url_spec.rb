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
          expect(page).to have_content("http://www.example.com/#{short_link.friendly_id}")
        end
      end
    end

    context "given an invalid uri" do
      context "like something weird" do
        let(:url) { "something weird" }

        it "displays the appropriate errors" do
          fill_in "URL", with: url
          click_button "Create"
          expect(page).not_to have_content(url)
          expect(page).to have_content("must be a RFC-2396 Compliant URI")
        end
      end

      context "or a rfc-2396 compliant string without a host" do
        let(:url) { "www.google.com" }

        it "displays the appropriate errors" do
          fill_in "URL", with: url
          click_button "Create"
          expect(page).not_to have_content(url)
          expect(page).to have_content("must have a host")
        end
      end
    end
  end
end
