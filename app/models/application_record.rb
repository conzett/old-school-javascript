class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def html_id
    "#{model_name.singular}-#{id}"
  end
end
