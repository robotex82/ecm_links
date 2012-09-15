require 'spec_helper'

module Ecm
  module Links
    describe CategoriesHelper do    
      describe "#render_link_category" do
        context "basic rendering" do
          before(:each) do
            @category = FactoryGirl.create(:ecm_links_category)
          end
          
          subject { helper.render_link_category(@category) }

          it { should have_content(@category.name) }          
        end

        context "i18n support" do
          before(:each) do
            @category = FactoryGirl.create(:ecm_links_category, :locale => 'de')
          end

          it { should_not have_content(@category.name) }  
        end
      end
    end
  end
end
