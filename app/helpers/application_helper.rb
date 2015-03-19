module ApplicationHelper
  def render_navigation(role)
    render "users/navigation/#{role}"
  rescue ActionView::MissingTemplate => e
    nil
  end

  def render_time
    sprintf('%.3f', (Time.now.usec - @start_time).abs / 1000000.0)
  end
end
