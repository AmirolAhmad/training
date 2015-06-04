# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item_id    :integer
#  quantity   :integer
#  startdate  :datetime
#  enddate    :datetime
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Booking < ActiveRecord::Base
  enum status: {"Active" => 0, "Closed" => 1, "Expired" => 2}
  after_initialize :set_default_status, :if => :new_record?
  after_create :subtract_quantity

  validate :available_quantity

  belongs_to :user
  belongs_to :item

  def is_active?
    status === "Active"
  end

  def is_closed?
    status === "Closed"
  end

  def is_expired?
    status === "Expired"
  end

  def set_default_status
    self.status ||= 0
  end

  def subtract_quantity
    new_quantity = self.item.quantity - self.quantity
    self.item.update_attributes(:quantity => new_quantity)
  end

  def available_quantity
    if self.quantity > self.item.quantity && self.item.quantity != 0
      errors.add(:quantity, ": You can't add more than #{self.item.quantity}")
    elsif self.item.quantity == 0
      errors.add(:quantity, ": Sorry! There is no stock for #{self.item.name}. Please choose another item")
    end
  end

  def overdue
    # Booking.all.each do |f|
      if self.enddate < Time.now
        self.update(status: 2)
      elsif self.enddate > Time.now
        self.update(status: 0)
      end
    # end
  end
end
