class ErrorsController < ActionController::Base
  layout "error"

  def show
    ex = request.env["action_dispatch.exception"] #発生した例外を取得

    if ex.kind_of?("action_dispatch.exception") #ルーティングエラーの場合trueに
      render "not_found", status: 404, formats: [:html]
    else
      render "intermal_server_error", status: 500, formats: [:html]
    end
  end
end