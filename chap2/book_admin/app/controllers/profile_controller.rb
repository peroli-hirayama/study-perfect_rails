class ProfileController < ApplicationController
  def show
  end

  def edit
  end

  def update

      user = current_user
      # params[:user] => {name: "bob", email: "bob@example.com"}
      user.update(user_params)
  end
  
  private
  def user_params
    param.require(:user).permit(:name, :email)
  end
end
