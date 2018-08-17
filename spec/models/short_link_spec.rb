require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  describe "friendly_id generation" do
    context "given a valid url" do
      let(:short_link) { ShortLink.new(url: "www.google.com") }

      it "returns a short code" do
        short_link.save
        expect(short_link.friendly_id).to match(/[A-Za-z0-9]{8}/)
      end
    end
  end
end
