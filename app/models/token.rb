class Token < ActiveRecord::Base
  validates :value,   :presence   => true,
                      :uniqueness => true
  validates :site_id, :presence   => true

  belongs_to :site
end
