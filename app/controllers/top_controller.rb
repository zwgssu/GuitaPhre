class TopController < ApplicationController
  def index
    @users = User.includes(:likers).sort {|a,b| b.likers.size <=> a.likers.size}
    @phrases = Phrase.includes(:likers).sort {|a,b| b.likers.size <=> a.likers.size}
    @themes = Theme.limit(4).order("created_at DESC")
    @tag = Phrase.pluck(:tag_1, :tag_2, :tag_3).flatten.uniq #pcluckでtagをまとめflattenで二次元配列を解除。uniqで重複を削除。
  end
end
