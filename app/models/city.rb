class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods
  has_many :reservations, :through => :listings

  extend Helper::ClassMethods
  include Helper::InstanceMethods

  def city_openings(start_date, end_date)
    available_listings = self.listings.keep_if do |listing|
      active_reservations = listing.reservations.keep_if do |reservations|
        
      end
    end
  end

end
