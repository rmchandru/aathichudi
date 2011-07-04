module ApplicationHelper

  def generate_diff(current, original)
    Diffy::Diff.new(current, original).to_s(:html)
  end

  def admin_signed_in?
    current_user and current_user.email == AppConfig.admin
  end

  def generate_logout_link
    if current_user.rpx_identifier =~ /www\.google\.com/
      'https://mail.google.com/mail/?logout&hl=en'
    elsif current_user.rpx_identifier =~ /twitter\.com/
      'http://twitter.com/?lang=en&logged_out=1'
    elsif current_user.rpx_identifier =~ /yahoo\.com/
      'http://login.yahoo.com/config/login?logout=1&.intl=in'
    elsif current_user.rpx_identifier =~ /live\.com/
      'http://login.live.com/logout.srf'
    end
  end

end
