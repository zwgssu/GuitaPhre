module ApplicationHelper

  #プロフィール画像を設定していない場合は初期画像を表示
  def cheak_use_picture(user, size)
    if user.profile_picture.attached?
      link_to (image_tag user.profile_picture.variant(gravity: :center, resize:"640x640^", crop:"640x640+0+0").processed, size: size, alt: "icon", class: "img-fluid rounded-circle"), user_path(user)
    else
      link_to (image_pack_tag "20227.jpg", alt: "icon", size: size, class: "img-fluid rounded-circle"), user_path(user)
    end
  end

  #ページタイトルがない場合はギタフレ！と表示させ、ある場合は最後に必ず -ギタフレ！がつく
  def page_title
    title = "ギタフレ！"
    title = @page_title + " - " + title if @page_title
    title
  end

  # text内のURLをリンク化させる
  require 'uri'  
  def convert_url_into_a_tag(text)
    URI.extract(text, ['http', 'https']).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"

      text.gsub!(url, sub_text)
    end
   return text
  end

  #favユーザー限定フレーズに設定していた場合はfavされていないorログインしていないユーザーには非表示
  #改善の余地あり
  def member_only?(phrase)
    !!phrase.user_only
  end

  def fav_user_only?(f)
      if member_only?(f)
        if user_signed_in? && current_user == f.user || current_user&.liking_user?(f.user)
          audio_tag url_for(f.music_file), controls: true, controlslist: "nodownload"
        else
          content_tag 'u', "Favユーザー限定フレーズ", class: "m-1 border rounded p-2"
        end
      else
        audio_tag url_for(f.music_file), controls: true, controlslist: "nodownload"
      end
  end

  def fav_user_only_link?(f, str)
      if member_only?(f)
        if user_signed_in? && current_user == f.user || current_user&.liking_user?(f.user)
          link_to str, phrase_path(f), class: "text-dark"
        else
          str
        end
      else
        link_to str, phrase_path(f), class: "text-dark"
      end
  end
  

end
