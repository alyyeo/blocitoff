class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.new(item_params)
    
    if @item.save
      flash[:notice] = "Item saved"
    else
      flash[:error] = "Item could not be saved. Please try again"
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def toggle
    @item = Item.find(params[:item_id])
    @item.update_attributes!(complete: !@item.complete)
    redirect_to current_user
  end
  
  def update
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])
    @item.assign_attributes(item_params)
    
    if @item.save
      flash[:notice] = "Item updated"
      redirect_to @user
    else
      flash[:error] = "Item could not be updated"
    end
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "Item was deleted"
    else
      flash[:error] = "Item could not be deleted. Please try again"
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :complete)
  end
end
