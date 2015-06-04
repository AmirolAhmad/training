class ItemsController < ApplicationController
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

  private

    def item_params
      params.require(:item).permit(:name, :code, :quantity, :status)
    end
end
