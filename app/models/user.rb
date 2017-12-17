# ORM - Object relational mapping
#
# the class name will be the table name
# all the columns of the table will be a function or object for this class

class User < ApplicationRecord
  validates :name, presence: true, exclusion: { in: %w(admin superuser) }
  validates :email, presence: true, uniqueness: true
  validates :mobile_no, numericality: true
  before_create :encrypt_password
  include Encrypt
  class PasswordcompValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        record.errors.add attribute, "Password does not match" unless value == record.confirm_password
    end
  end
  validates :password, passwordcomp: true, length: {maximum: 30, min: 5}, on: :create
  validates :confirm_password, length: {maximum: 30, min: 5}, on: :create
  has_one :image
  accepts_nested_attributes_for :image
  def self.authenticate(email, password)
    user = User.where(email: email, password: Digest::MD5.hexdigest(password)).last
    unless user.blank?
      return user
    else
      return nil
    end
  end
  before_destroy :take_backup
  def take_backup
    File.open("#{Rails.root}/public/backup.json", "a+") do | foo |
      foo.write(self.to_json)
    end
  end
  def self.omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.token = auth.credentials.token
      user.email = auth.info.email
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.save(validate: false)
      #im = Image.new(photo: "http://graph.facebook.com/v2.6/860101950679738/picture", entity: user)
      # im.save(validate: false)
      # user.image = im
      # user.save(validate: false)
      return user
    end
  end
end




=begin
  users = User.all
    users.each do | i |
     i.password = Digest::MD5.hexdigest(i.password)
     i.confirm_password = Digest::MD5.hexdigest(i.confirm_password)
     i.save unless i.email == "password@gmail.com"
    end
=end

#Assignment
# hide the other user prifile .
# cancan
