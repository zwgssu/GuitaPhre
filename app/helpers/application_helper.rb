module ApplicationHelper
  def cheak_use_picture(user, size)
    if user.profile_picture.attached?
      link_to (image_tag user.profile_picture.variant(gravity: :center, resize:"640x640^", crop:"640x640+0+0").processed, size: size, alt: "icon", class: "img-fluid rounded-circle"), user_path(user)
    else
      link_to (image_tag "20227.jpg", alt: "icon", size: size, class: "img-fluid rounded-circle"), user_path(user)
    end
  end

  def page_title
    title = "ギタフレ！"
    title = @page_title + " - " + title if @page_title
    title
  end

  require 'uri'  
  def convert_url_into_a_tag(text)
    URI.extract(text, ['http', 'https']).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"

      text.gsub!(url, sub_text)
    end
   return text
  end

  def member_only?(phrase)
    !!phrase.user_only
  end

  def fav_user_only?(f)
    if user_signed_in?
      if member_only?(f)
        if current_user == f.user
          audio_tag url_for(f.music_file), controls: true, controlslist: "nodownload"
        else
          if current_user.liking_user?(f.user)
            audio_tag url_for(f.music_file), controls: true, controlslist: "nodownload"
          else
            "favユーザー限定フレーズ"
          end
        end
      else
        audio_tag url_for(f.music_file), controls: true, controlslist: "nodownload"
      end
    else
      if member_only?(f)
        "favユーザー限定フレーズ"
      else
        audio_tag url_for(f.music_file), controls: true, controlslist: "nodownload"
      end
    end
  end

  def fav_user_only_link?(f, str)
    if user_signed_in?
      if member_only?(f)
        if current_user == f.user
          link_to str, phrase_path(f), class: "text-dark"
        else
          if current_user.liking_user?(f.user)
            link_to str, phrase_path(f), class: "text-dark"
          else
            str
          end
        end
      else
        link_to str, phrase_path(f), class: "text-dark"
      end
    else
      if member_only?(f)
        str
      else
        link_to str, phrase_path(f), class: "text-dark"
      end
    end
  end
  

end
