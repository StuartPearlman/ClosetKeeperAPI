class ItemsController < ApplicationController

	def create
		item = Item.new(item_params)
		item.user_id = @user.id
		if item.save
			render json: item, status: 201
		else
			render json: item.errors, status: 422
		end
	end

	def destroy
		item = find_item
		item.destroy
		head 204
	end

	def index
		render json: @user.items.as_json, status: 200
	end

	def show
		item = find_item
		render json: item.as_json, status: 200
	end

	def update
		item = find_item
		if item.update(item_params)
			render json: item.as_json, status: 200
		end
	end

	def find_item
		Item.find(params[:id])
	end

	private
	def item_params
		params.require(:item).permit(:type, :brand, :size, :color, :description)
	end
end
