module ApplicationHelper

  def gravatar_for(user, options={size:200, class:"rounded shadow mx-auto d-block center" })
    size=options[:size]
    image_class=options[:class]
    email_address=user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}/?s=#{size}"
    image_tag(gravatar_url,alt:user.username, class:image_class )
  end

end
