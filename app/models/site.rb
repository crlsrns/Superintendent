class Site < ActiveRecord::Base
  validates :name,  :presence   => true
  validates :url,   :presence   => true
  validates :api_token, :presence   => true,
                        :uniqueness => true,
                        :length     => { :is => 32 }

  stampable
end
