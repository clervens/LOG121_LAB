class ApplicationResourcesController < InheritedResources::Base
	respond_to :html, :json

  def create
    create! notice: "#{resource_name} #{t 'was_created'}"
  end

  def update
    update! notice: "#{resource_name} #{t 'was_updated'}"
  end

  def destroy
    destroy! notice: "#{resource_name} #{t 'was_destroyed'}"
  end
protected
  def resource_name(plurial: true)
    slice = 's' if plurial
    slice << "Controller"
    name = self.class.name
    name.slice! slice
    name
  end
end