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

  def user_fav_btn(user)
    unless @user == current_user
      if current_user.liking_user?(user)
        link_to "ファン解除", favorite_user_path(fav_user_id: user.id), method: :delete, class: "btn btn-danger"
      else
        link_to "ファンになる", favorite_users_path(fav_user_id: user.id), method: :post, class: "btn btn-success"
      end
    end
  end
end
