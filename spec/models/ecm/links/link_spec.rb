require 'spec_helper'

module Ecm
  module Links
    describe Link do
      subject { FactoryGirl.create(:ecm_links_link) }

      context "associations" do
        it { should belong_to(:ecm_links_category) }
      end
      
      context "basic validations" do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:url) }
        
        it { should validate_uniqueness_of(:name).scoped_to(:ecm_links_category_id) }
        it { should validate_uniqueness_of(:url).scoped_to(:ecm_links_category_id) }
      end
      
      context "acts as list" do
        it { should respond_to(:move_to_top) }
        it { should respond_to(:move_higher) }
        it { should respond_to(:move_lower) }
        it { should respond_to(:move_to_bottom) }
      end
      
      context "acts as markup" do
        subject { 
          Factory.create(:ecm_links_link, 
                         :description => "h1. This is a heading"
          ) 
        }
        
        it { should validate_presence_of(:markup_language) }   
         
        %w(markdown textile rdoc).each do |value|
          it { should allow_value(value).for(:markup_language) }
        end

        %w(some other values that are not allowed).each do |value|
          it { should_not allow_value(value).for(:markup_language) }
        end  
        
        context "description.to_html" do
          specify { subject.description.to_html.should eq("<h1>This is a heading</h1>") }
        end
      end
    end
  end
end
