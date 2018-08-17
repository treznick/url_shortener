require 'rails_helper'

RSpec.describe "short link redirection" do
  describe "GET /:valid_short_link_friendly_id" do
    context "given a short link with a friendly_id" do
      let(:short_link) { FactoryBot.create(:short_link) }

      it "redirects to the appropriate url" do
        get "/#{short_link.friendly_id}"

        expect(response).to redirect_to short_link.url
      end
    end
  end

  describe "GET /unknown short_link_friendly_id" do
    context "given some unknown friendly identifier" do
      let(:friendly_id) { "foobarbaz" }

      it "redirects to the root url" do
        get "/#{friendly_id}"

        expect(response).to redirect_to root_url
      end
    end
  end
end
