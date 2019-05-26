class SessionsController < ApplicationController
  # @user is much more explicit I think I'll keep this, tyvm rubocop
  # rubocop:disable Naming/MemoizedInstanceVariableName
  def new
    @user ||= User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
