module Permalinkable

  extend ActiveSupport::Concern

  included do
    # Callbacks
    before_save :set_permalink

    # Validations
    validates :permalink, uniqueness: { case_sensitive: false }
  end

  def to_param
    self.permalink
  end

private

  def set_permalink
    if self.respond_to? :name
      permalinkable_value = self.name
    elsif self.respond_to? :title
      permalinkable_value = self.title
    else
      raise NotPermalinkableError.new("Model must have an attribute 'name' or 'title' to be permalinkable.")
    end

    self.permalink = permalinkable_value.parameterize unless permalinkable_value.nil?
  end

  class NotPermalinkableError < StandardError
  end

end
