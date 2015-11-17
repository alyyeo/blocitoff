class Api::V1::UsersController < Api::V1::BaseController
    #  before_action :authenticated?
    
    def show
        user = User.find(params[:id])
        render json: user, status: 200
    end
    
    def index
        users = User.all
        render json: users, each_serializer: UserSerializer
    end
    
    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end