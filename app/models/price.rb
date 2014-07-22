class Price < ActiveRecord::Base
  mount_uploader :file, PriceUploader
  has_many :products
end
