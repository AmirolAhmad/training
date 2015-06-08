# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  quantity   :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base
  enum status: {"Returnable" => 0, "Not Returnable" => 1}
  after_create :random_product_code

  has_many :bookings, dependent: :destroy

  validates_presence_of :name, :quantity, :status

  def is_returnable?
    status === "Returnable"
  end

  def is_not_returnable?
    status === "Not Returnable"
  end

  def random_product_code
    random = ['1'..'9'].map { |i| i.to_a }.flatten
    product_code = (0...7).map { random[rand(random.length)] }.join
    self.update_attributes(:code => product_code)
  end
end
