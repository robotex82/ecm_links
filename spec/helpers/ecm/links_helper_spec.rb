require 'spec_helper'

module Ecm
  describe LinksHelper do    
    describe "#render_link_footer" do
      before(:each) do
        @categories = FactoryGirl.create_list(:ecm_links_category_for_link_footer, 6)
      end
      
      subject { helper.render_link_footer }
      
      it "should show all category names" do
        @categories.each do |category|
          subject.should have_content(category.name)
        end
      end
    end
  end
end
