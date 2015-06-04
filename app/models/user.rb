# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  role                   :integer
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  status                 :integer
#

class User < ActiveRecord::Base
  enum role: [:user, :admin, :supplier]
  enum status: {"Active" => 0, "Suspend" => 1}
  after_initialize :set_default_role, :if => :new_record?

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings

  def set_default_role
    self.role ||= :user
    self.status ||= "Active"
  end

  def is_active?
    status === "Active"
  end

  def is_suspend?
    status === "Suspend"
  end

  def check_status
    self.bookings.pluck(:status).include?(2) ? self.update(status: 1) : self.update(status: 0)
  end
end
