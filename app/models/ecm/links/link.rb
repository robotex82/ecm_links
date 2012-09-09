class Ecm::Links::Link < ActiveRecord::Base
  # database settings
  self.table_name = 'ecm_links_links'
  
  # acts as list
  acts_as_list :scope => :ecm_links_category
  
  # acts as markup
  acts_as_markup :language => :variable, :columns => [ :description ]
  
  # associations
  belongs_to :ecm_links_category, 
             :class_name => Ecm::Links::Category, 
             :counter_cache => :ecm_links_links_count

  # attributes
  attr_accessible :description,
                  :ecm_products_product_id,
                  :markup_language,
                  :name, 
                  :position, 
                  :url

  # callbacks
  after_initialize :set_defaults  
  
  # constants
  MARKUP_LANGUAGES = %w(markdown textile rdoc)  

  # validations
  validates :name, :presence => true, :uniqueness => { :scope => [ :ecm_links_category_id ] }
  validates :url,  :presence => true, :uniqueness => { :scope => [ :ecm_links_category_id ] }
  validates :markup_language, :presence  => true, 
                              :inclusion => MARKUP_LANGUAGES
  
  private
  
  def set_defaults
    if self.new_record?
      self.markup_language ||= 'textile'
    end  
  end
end
