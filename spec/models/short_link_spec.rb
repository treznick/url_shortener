require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  describe "friendly_id generation" do
    let(:short_link) { ShortLink.new(url: url) }

    context "given a valid url" do
      let(:url) { "https://www.google.com" }

      it "returns a short code" do
        short_link.save
        expect(short_link.friendly_id).to match(/[A-Za-z0-9]{8}/)
      end
    end

    context "given an invalid friendly id" do
      context "such as some garbage" do
        let(:url) { "some sort of garbage" }

        it "is invalid" do
          expect(short_link).not_to be_valid
          expect(short_link.errors.details[:url]).to include(a_hash_including(error: :not_rfc2396_compliant))
        end
      end

      context "or a RFC2396 compliant string but that has no host" do
        let(:url) { "www.google.com" }

        it "is invalid" do
          expect(short_link).not_to be_valid
          expect(short_link.errors.details[:url]).to include(a_hash_including(error: :blank_host))
        end
      end
    end
  end
end
