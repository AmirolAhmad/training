module ApplicationHelper
  def body_class
  "#{controller_name} #{action_name}"
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "https://gravatar.com/avatar/#{gravatar_id}.png?s=35"
  end
end
