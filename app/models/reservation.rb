class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :guest, :class_name => "User"
  has_one :review

  validates :checkin, presence: true
  validates :checkout, presence: true
  validate :checkout_after_checkin
  validate :user_not_guest

  def duration
    self.checkout.mjd - self.checkin.mjd
  end

  def total_price
    duration * self.listing.price
  end

  private

  def checkout_after_checkin
    if checkin && checkout
      errors.add(:checkout, "checkout occurs before checkin") if checkin >= checkout
    end
  end

  def user_not_guest
    if guest
      errors.add(:guest, "user can't be guest") if guest_id == listing.host_id
    end
  end

end
