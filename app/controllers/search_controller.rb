class SearchController < ApplicationController
  def search
    @model = params["search"]["model"] #serchformからmodelとvalueを取得する
    @value = params["search"]["value"]

    #modelの中身に合わせて分岐させ、タイトルとタグ、もしくはユーザー名をvalueをもとにデータを取得しdatesに入れる
    if @model == "phrase"
      @dates = Phrase.where("title LIKE ? OR tag_1 LIKE ? OR tag_2 LIKE ? OR tag_3 LIKE ? OR body LIKE ?", "%#{@value}%", "%#{@value}%", "%#{@value}%", "%#{@value}%", "%#{@value}%").page(params[:page]).per(6).order('created_at DESC')
    elsif @model == "theme"
      @dates = Theme.where("title LIKE ? OR tag_1 LIKE ? OR tag_2 LIKE ? OR tag_3 LIKE ? OR overview LIKE ?", "%#{@value}%", "%#{@value}%", "%#{@value}%", "%#{@value}%", "%#{@value}%").page(params[:page]).per(6).order('created_at DESC')
    elsif @model == "user"
      @dates = User.where("username LIKE ?", "%#{@value}%").page(params[:page]).per(6).order('created_at DESC')
    end
  end
end
