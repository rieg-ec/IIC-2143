# frozen_string_literal: true

class ApiResponder < ActionController::Responder
  def api_behavior
    raise MissingRenderer, format unless has_renderer?

    if delete?
      head :no_content
    elsif post?
      display resource, status: :created
    else
      display resource
    end
  end
end
