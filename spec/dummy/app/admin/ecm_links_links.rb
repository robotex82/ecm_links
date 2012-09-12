ActiveAdmin.register Ecm::Links::Link do
  form do |f|
    f.inputs do
      f.input :ecm_links_category, :as => :select, :collection => nested_set_options(Ecm::Links::Category) { |c| "#{'&#160;&#160;&#160;&#160;' * c.level} |-- #{c.to_s}".html_safe }
      f.input :name
      f.input :url
      f.input :description
    end
    
    f.inputs do
      f.input :markup_language, :as => :select, :collection => Ecm::Links::Link::MARKUP_LANGUAGES    
    end
    
    f.actions
  end
  
  index do
    selectable_column
    column :ecm_links_category
    column :name
    column :url
    column :created_at
    column :updated_at
    default_actions
  end
  
  show do
    attributes_table do
      row :ecm_links_category
      row :name
      row :url
      row :markup_language
      row :created_at
      row :updated_at
    end 
    
    panel Ecm::Links::Link.human_attribute_name(:description) do
      div { ecm_links_link.description }
    end 
  end
end if defined?(ActiveAdmin)
