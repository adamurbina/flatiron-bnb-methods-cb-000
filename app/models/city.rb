class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods
  has_many :reservations, :through => :listings

  extend Helper::ClassMethods
  include Helper::InstanceMethods

  after_initialize :make_method

  # def city_openings(start_date, end_date)
  #
  #   start_date = Date.parse(start_date)
  #   end_date = Date.parse(end_date)
  #   available_listings = self.listings.all
  #
  #   self.reservations.all.each do |res|
  #     if !(res.checkout <= start_date || res.checkin >= end_date)
  #       available_listings.delete(res.listing)
  #     end
  #   end
  #   available_listings
  # end

end
