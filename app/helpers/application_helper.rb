module ApplicationHelper

  def gravatar_for(user, options={size:200, class:"rounded shadow mx-auto d-block center" })
    size=options[:size]
    image_class=options[:class]
    email_address=user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}/?s=#{size}"
    image_tag(gravatar_url,alt:user.username, class:image_class )
  end


  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end
  
  def markdown(text)
    coderayified = CodeRayify.new(:filter_html => true, 
                                  :hard_wrap => true)
    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :superscript => true,
      :strikethrough => true,
      :no_styles => true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
  



end
