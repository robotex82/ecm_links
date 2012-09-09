FactoryGirl.define do
  factory :ecm_links_category, :class => Ecm::Links::Category do
    locale 'en'
    sequence(:name) { |n| "Link Category ##{n}" }
    markup_language 'textile'
    
    factory(:ecm_links_category_with_parent) do
      locale nil
      association :parent, :factory => :ecm_links_category
    end
  end
end
