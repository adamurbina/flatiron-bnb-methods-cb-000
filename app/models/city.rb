class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods
  has_many :reservations, :through => :listings

  extend Helper::ClassMethods
  include Helper::InstanceMethods

  def city_openings(start_date, end_date)

    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)
    city_reservations = self.reservations.all
    available_listings = []

    city_reservations.each do |res|
      available_listings << res.listing if (res.checkout <= start_date || res.checkin >= end_date)
    end
    available_listings.uniq
  end

end
