module Paginatable

  extend ActiveSupport::Concern

  included do

    # Behaviors
    paginates_per 6

    # Scopes
    scope :from_category, ->(category) { category.nil? ? scoped : where(category: category) }

  end

end
