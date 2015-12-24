class UsersController < ApplicationController
    def retire
        @current_user = current_user
    end

    def destroy
        if current_user.destroy
            reset_session
            redirect_to root_path, notice: '退会完了しました'
        else
            render :retire
        end
    end
end
