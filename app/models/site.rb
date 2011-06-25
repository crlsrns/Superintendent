class Site < ActiveRecord::Base
  validates :name,  :presence   => true
  validates :url,   :presence   => true,
                    :uniqueness => true

  has_many  :tokens
end
