FactoryGirl.define do
  factory :ecm_links_link, :class => Ecm::Links::Link do
    sequence(:name) { |n| "#{Faker::Company.name} #{n} Link" }
    sequence(:url) { |n| "#{Faker::Internet.http_url} #{n} Link" }
    markup_language 'textile'
  end
end
