FactoryBot.define do
  factory :short_link do
    sequence :url do |n|
      "https://www.zombo.com/#{n}"
    end
  end
end
