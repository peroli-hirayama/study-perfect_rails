class UsersController < ApplicationController
    def retire
        @current_user = current_user
    end
end
