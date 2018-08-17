require 'rails_helper'

RSpec.describe ShortLinkUrlPresenter do
  describe "#shortened_url" do
    context "given an object that has a friendly_id" do
      let(:obj) { OpenStruct.new(friendly_id: "foo") }
      let(:subject) { described_class.new(obj, TestingView.new) }

      it "builds the correct url" do
        expect(subject.shortened_url).to eq("http://www.example.com/foo")
      end
    end
  end
end
