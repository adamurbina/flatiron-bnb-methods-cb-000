class Review < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :guest, :class_name => "User"

  validates :rating, presence: true
  validates :description, presence: true
  validates :reservation, presence: true

  private

  def valid_reservation
    if reservation
      if reservation
        
      end
    end
  end

end
