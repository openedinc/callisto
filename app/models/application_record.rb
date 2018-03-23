class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  max_paginates_per 100

  private
    def self.optional_param_scope(name = nil, value = nil)
      if value.present?
        where("#{name}" => value)
      end
    end

    def self.optional_date_scope(name = nil, value = nil)
      if value.present?
        where("date(#{name}) = ?", value)
      end
    end
end
