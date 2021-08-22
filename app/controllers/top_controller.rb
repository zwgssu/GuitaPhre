class TopController < ApplicationController
  def index
    @users = User.limit(6).order('created_at DESC')
    @phrases = Phrase.includes(:likers).sort {|a,b| b.likers.size <=> a.likers.size}
    @themes = Theme.limit(4).order("created_at DESC")
    @random = Phrase.order("RAND()")
  end
end
