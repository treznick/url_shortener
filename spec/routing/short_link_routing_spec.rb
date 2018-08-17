require 'rails_helper'

RSpec.describe "routing to short_link_urls", type: :routing do
  context "given a the friendly_id of a short_link" do
    let(:short_link) { FactoryBot.create(:short_link) }

    it "routes to the ShortLinksController#show" do
      expect(get: "/#{short_link.friendly_id}").to route_to(controller: "short_links", action: "show", friendly_id: short_link.friendly_id)
    end
  end
end
