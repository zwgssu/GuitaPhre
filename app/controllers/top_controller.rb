class TopController < ApplicationController
  def index
    @users = User.limit(6).order('created_at DESC')
    @phrase = Phrase.limit(4).order("created_at DESC")
  end
end
