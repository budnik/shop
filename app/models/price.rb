class Price < ActiveRecord::Base
  mount_uploader :file, PriceUploader
  has_many :products, dependent: :destroy
  validates_presence_of :file
end
