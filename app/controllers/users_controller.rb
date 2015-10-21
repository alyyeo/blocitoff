class UsersController < ApplicationController
  def show
    @user = User.where(id: 1)
  end
end
