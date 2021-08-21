class FavoritePhrasesController < ApplicationController
  before_action :authenticate_user!

  def create
    @phrase = Phrase.find(params[:phrase_id])
    current_user.favorite_phrase(@phrase)
  end

  def destroy
    @phrase = Phrase.find(params[:phrase_id])
    current_user.unfavorite_phrase(@phrase)
  end
end
