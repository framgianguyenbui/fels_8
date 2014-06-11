module UsersHelper
  def gravatar_for(user,options={size:100})

    image_tag(gravatar_url(user.name,{size:size}), alt: user.name, class: "gravatar")
  end

  def gravatar_url(user, options={size: 100})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size];
    'https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}'
  end
end
