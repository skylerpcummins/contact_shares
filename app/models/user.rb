class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts, dependent: :destroy,
    class_name: "Contact",
    foreign_key: :user_id,
    primary_key: :id

  has_many :contact_shares, dependent: :destroy,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "ContactShare"

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact



end
