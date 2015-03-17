module ApplicationHelper
  def render_navigation(role)
    render "users/navigation/#{role}"
  rescue ActionView::MissingTemplate => e
    nil
  end
end
