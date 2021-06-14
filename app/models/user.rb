class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :histories
  
  validates :last_name,          presence: true
  validates :first_name,         presence: true
  validates :last_name_kana,     presence: true
  validates :first_name_kana,    presence: true
  validates :nickname,           presence: true
  validates :birthday,           presence: true

  with_options presence: true do
    validates :last_name,:first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :last_name_kana,:first_name_kana, format: {with: /\A[ァ-ヶー-]+\z/, message: "is invalid. Input full-width characters."}
    #validates :password, format: {with: /\[a-z0-9]+\z/}, message: "is invalid. Input characters."}
    #validates :date, format: { /\A\d{4}-\d{2}-\d{2}\z/}, message: "is invalid. Input Date."}
  end
end

