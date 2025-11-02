class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 8 }, confirmation: true, if: ->{new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: ->{new_record? || changes[:crypted_password] }
  validates :first_name, presence: true, length: {maximum: 10 }
  validates :last_name, presence: true, length: {maximum: 10 }
  validates :nickname, presence: true, length: {maximum: 40 }
end
