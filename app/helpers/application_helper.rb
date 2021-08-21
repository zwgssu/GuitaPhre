module ApplicationHelper
  def cheak_use_picture(user, size)
    if user.profile_picture.attached?
      link_to (image_tag user.profile_picture.variant(gravity: :center, resize:"640x640^", crop:"640x640+0+0").processed, size: size, alt: "icon", class: "img-fluid rounded-circle"), user_path(user)
    else
      link_to (image_tag "ki-tyan.jpeg", alt: "icon", size: size, class: "img-fluid rounded-circle"), user_path(user)
    end
  end

  def page_title
    title = "ギタフレ！"
    title = @page_title + " - " + title if @page_title
    title
  end
end
