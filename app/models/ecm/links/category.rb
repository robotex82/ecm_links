class Ecm::Links::Category < ActiveRecord::Base
  # database settings
  self.table_name = 'ecm_links_categories'

  # acts as markup
  acts_as_markup :language => :variable, :columns => [ :long_description, :short_description ]

  # attributes
  attr_accessible :depth,
                  :lft,
                  :locale,
                  :long_description,
                  :markup_language,
                  :name,
                  :parent_id,
                  :rgt,
                  :short_description,
                  :slug

  # awesome nested set
  acts_as_nested_set
  default_scope :order => 'lft ASC'

  # callbacks
  after_initialize :set_defaults

  # constants
  MARKUP_LANGUAGES = %w(markdown textile rdoc)

  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # validations
  validates :locale, :presence => true, :if => Proc.new { |c| c.parent.nil? }
  validates :locale, :absence => true, :if => Proc.new { |c| !c.parent.nil? }
  validates :name, :presence => true,
                   :uniqueness => { :scope => [ :parent_id ] }
  validates :markup_language, :presence => true,
                              :inclusion => MARKUP_LANGUAGES

  private
    # private methods

    def set_defaults
      if self.new_record?
        self.markup_language ||= 'textile'
      end
    end
end
