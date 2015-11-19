class Api::V1::ItemsController < Api::V1::BaseController
    # before_action :authenticated?
    
    def index
        items = Item.all
        render json: items, status: 200
    end
    
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
    
    def update
        item = Item.find(params[:id])
        if item.update(item_params)
            render json: item
        else
            render json: { errors: item.errors.full_messages}, status: :unprocessable_entity
        end
    end
    
    def destroy
        begin
            item = Item.find(params[:id])
            item.destroy
            render json: {}, status: :no_content
        rescue ActiveRecord::RecordNotFound
            render :json => {}, :status => :not_found
        end
    end
    
    private
    def item_params
        params.require(:item).permit(:name, :complete)
    end
end