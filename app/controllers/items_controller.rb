class ItemsController < ApplicationController
  def create
    @user = current_user
    @item = @user.items.new(item_params)
    
    if @item.save
      flash[:notice] = "Item saved"
      redirect_to current_user
    else
      flash[:error] = "Item could not be saved. Please try again"
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name)
  end
end
