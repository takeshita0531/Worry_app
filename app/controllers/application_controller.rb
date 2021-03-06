class ApplicationController < ActionController::Base
 before_action :set_current_user
 
 def set_current_user
  @current_user = User.find_by(id: session[:user_id])
  @user = User.find_by(id: params[:id])
 end
 

  

 
 
 protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
 private
 
def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
end
  
  
  protected

  
  def configure_permitted_parameters
    added_attrs = [ :email, :username, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  
  end
  
end 

  
