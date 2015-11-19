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
    
    def update
        user = User.find(params[:id])
        if user.update_attributes(user_params)
            render json: user
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    def destroy
        begin
            user = User.find(params[:id])
            user.destroy
            render json: {}, status: :no_content
        rescue ActiveRecord::RecordNotFound
            render :json => {}, :status => :not_found
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end