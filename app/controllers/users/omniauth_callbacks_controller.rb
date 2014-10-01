class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    auth = request.env["omniauth.auth"]
    service = Service.find_by(provider: auth.provider, uid: auth.uid)

    if service.present?
      sign_in_and_redirect service.user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      user = User.new(email: auth.info.email)
      service = user.services.build(
        provider: auth.provider,
        uid: auth.uid,
        nickname: auth.info.nickname,
        access_token: auth.credentials.token,
        access_secret: auth.credentials.secret
      )
      if user.save(validate: false)
        sign_in_and_redirect user, event: :authentication # this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
      else
        session["devise.github_data"] = request.env["omniauth.auth"]
        redirect_to root_url
      end
    end
  end
end
