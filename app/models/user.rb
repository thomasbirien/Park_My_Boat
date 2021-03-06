class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :send_welcome_email
  after_create :subscribe_to_newsletter

  acts_as_paranoid

  has_many :bookings
  has_many :boats

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :civility, presence: true
  validates :address, presence: true
  validates :post_code, presence: true
  validates :city, presence: true
  validates :country, presence: true

  private
  def send_welcome_email
    UserNotifier.send_signup_email(self).deliver
  end

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).call
  end
end
