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
end
