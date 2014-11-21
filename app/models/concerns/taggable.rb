module Taggable

  extend ActiveSupport::Concern

  included do

    # Behaviours
    acts_as_taggable_on :tags

  end

end
