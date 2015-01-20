module Publishable

  extend ActiveSupport::Concern

  included do
    # Callbacks
    before_save :set_published_at, if: Proc.new { |model| model.published_at == nil }
  end

  def to_param
    self.permalink
  end

private

  def set_published_at
    self.published_at = Time.current
  end

end
