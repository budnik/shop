class Price < ActiveRecord::Base
  mount_uploader :file, PriceUploader
end
