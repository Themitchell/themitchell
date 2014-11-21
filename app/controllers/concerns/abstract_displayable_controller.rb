module AbstractDisplayableController

  include ActiveSupport::Concern

  def index
    @category = Category.where(permalink: params[:category]).first
    instance_variable_set("#{public_variable_name.pluralize}".to_sym, klass.order('published_at DESC').page(params[:page]))
  end

  def show
    instance_variable_set("#{public_variable_name}".to_sym, klass.where(permalink: params[:id]).first)
  end

private

  def public_variable_name
    "@#{klass.name.underscore.downcase}"
  end

  def klass
    raise NotImplementedError
  end
end
