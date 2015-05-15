#coding: utf-8
class SessionsController < ApplicationController
  def new　#loginフォームへの初期設定
  end

  def create
    user = User.find_by(email:params[:session][:email]) #emailでユーザーの呼び出し&特定
    if user.correct_password?(params[:session][:password]) #引数の引き渡しをparams[:session][:password]で　= input_passwordで渡される 
        render :text => 'Loginしました！'
    else 
        redirect_to 'login'
        return
    end
    # if (MD5.hexdigest(password) == user.password_digest)
    # 	render :text => 'Loginしました！'
    # else
    # 	redirect_to 'login'
    # end
  end

  def destroy
	#login状態の破棄
	session[:user_id] = nil
	redirect_to root_url
  end

end
