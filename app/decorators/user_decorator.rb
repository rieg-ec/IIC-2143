# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def gravatar_url
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}"
  end

  def avatar_url
    return gravatar_url unless avatar.attached?

    Rails.application.routes.url_helpers.rails_representation_url(
      avatar.variant(resize: '256x256^', extent: '256x256', gravity: 'Center').processed,
      only_path: true
    )
  end
end
