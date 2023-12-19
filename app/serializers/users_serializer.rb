class UsersSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :fullname
  has_many :articles
end