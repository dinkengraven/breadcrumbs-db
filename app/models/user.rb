class User < ActiveRecord::Base
  has_one :api_key, class_name: "ApiKey"

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: :friend_id
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :created_breadcrumbs, class_name: "Breadcrumb", foreign_key: :creator_id
  has_many :received_breadcrumbs, class_name: "Breadcrumb", foreign_key: :receiver_id

  has_many :created_pseudocrumbs, class_name: "Pseudocrumb", foreign_key: :creator_id
  has_many :received_pseudocrumbs, class_name: "Pseudocrumb", foreign_key: :receiver_id

  validates :first_name, { presence: true }
  validates :last_name, { presence: true }
  validates :email, { presence: true, uniqueness: true }
  validates_format_of :email, with: /\A[[-._]0-9a-zA-Z]{3,}@[a-z]{2,}.[a-z]{2,}\z/i
  validates :password_digest, { presence: true }

  has_secure_password

  after_save :set_api_key

  private
    def set_api_key
      self.api_key = ApiKey.create
    end
end
