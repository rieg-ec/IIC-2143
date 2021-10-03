# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :course_users, dependent: :destroy
  has_many :courses_owned, through: :course_users, source: :course, inverse_of: :teachers, dependent: :destroy
  has_many :courses_enrolled, through: :course_users, source: :course, inverse_of: :students, dependent: :nullify

  has_many :questions, through: :course_users, source: :questions, dependent: :destroy, inverse_of: :author
  has_many :reviews, through: :course_users, source: :review, dependent: :destroy


  has_one_attached :avatar

  def avatar_url
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    return gravatar_url unless avatar.attached?

    Rails.application.routes.url_helpers.rails_representation_url(
      avatar.variant(resize: '256x256^', extent: '256x256', gravity: 'Center').processed,
      only_path: true
    )
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
