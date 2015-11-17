class Api::V1::ItemsController < Api::V1::BaseController
    # before_action :authenticated?
    
    def show
        item = Item.find(params[:id])
        render json: item, status: 200
    end
    
    def create
        item = Item.new(item_params)
        if item.save
            render json: item
        else
            render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    private
    def item_params
        params.require(:item).permit(:name, :complete)
    end
end