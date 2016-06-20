class UjsController < ApplicationController
  # Example in view
  # ```
  #<%= form_tag do %>
  #  <%= text_field_tag :common_name, nil, :'data-autocomplete' => '/ujs/ac/taxa/common_name' %>
  #  <%= submit_tag %>
  #<% end %>
  # ```
  def autocomplete
    render js: <<-JS
      $("input[data-autocomplete='/ujs/ac/#{params["resource"]}/#{params["field"]}']").autocomplete({source: #{get_query}});
    JS
  end

  private
  def approved_resources
    #[Site, Subsite, Property, ActiveAdmin::Comment] 
    ActiveRecord::Base.descendants - [AdminUser] + [Taxon]
  end

  def filtered_resource
    approved_resources.detect {|r| r.table_name == params["resource"] }
  end

  def filtered_field
    filtered_resource.columns.detect {|f| f.name == params["field"] }
  end

  def get_query
    filtered_resource.
      where(
        filtered_resource.
        arel_table[filtered_field.name].
        matches("%#{params["input"]}%")
      ).
      uniq.
      limit(8).
      select(filtered_field.name.to_sym).
      map {|v| v.send filtered_field.name}
  end
end
