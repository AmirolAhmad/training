class Booking < ActiveRecord::Base
  enum status: {"Active" => 0, "Closed" => 1, "Expired" => 2}

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
end
