class ItemsController < ApplicationController
  before_filter :set_item, only: [:edit, :update, :destroy]
  before_filter :admin_only

  def index
    @items = Item.all
  end

  def new
    @item ||= Item.new
    render
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: "Awesome! New item has been added to the list"
    else
      render 'new'
    end
  end

  def edit
    if @item
      render
    else
      redirect_to items_path, notice: "Ooppss! Item not found. Sorry!"
    end
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: "Awesome! Item has been updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "Note! The item has been removed!"
  end

  private

    def set_item
      @item = Item.find_by_id(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :code, :quantity, :status)
    end
end
