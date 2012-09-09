require 'spec_helper'

module Ecm
  module Links
    describe Category do
      subject { Factory.create(:ecm_links_category) }
      
      context "basic validations" do
        it { should validate_presence_of(:name) }
        it { should validate_uniqueness_of(:name).scoped_to(:parent_id) }
      end
      
      context "acts as markup" do
        subject { 
          Factory.create(:ecm_links_category, 
                         :short_description => "h1. This is a heading",
                         :long_description  => "h1. This is a heading"
          ) 
        }
        
        it { should validate_presence_of(:markup_language) }   
         
        %w(markdown textile rdoc).each do |value|
          it { should allow_value(value).for(:markup_language) }
        end

        %w(some other values that are not allowed).each do |value|
          it { should_not allow_value(value).for(:markup_language) }
        end  
        
        context "short_description.to_html" do
          specify { subject.short_description.to_html.should eq("<h1>This is a heading</h1>") }
        end

        context "long_description.to_html" do
          specify { subject.long_description.to_html.should eq("<h1>This is a heading</h1>") }        
        end
      end

      context "acts as tree" do
        it { should respond_to(:root) }

        it "should require a locale if it is a root node" do
          subject.locale = nil
          subject.should_not be_valid
        end

        it "should not accept a locale if it is not a root node" do
          product_category = FactoryGirl.create(:ecm_links_category_with_parent)
          product_category.locale = 'en'
          product_category.should_not be_valid
        end
      end
      
      context "friendly id" do
        subject { Factory.create(:ecm_links_category, :name => 'Look, a slugged category!') }
        
        its(:to_param) { should eq('look-a-slugged-category') }
      end
    end
  end
end
