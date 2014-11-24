class OutfitItemsController < ApplicationController
	
	def create
		outfit_item = OutfitItem.new(outfit_item_params)
		if outfit_item.save
			render json: outfit_item, status: 201
		else
			render json: outfit_item.errors, status: 422
		end
	end

	def destroy
		outfit_item = OutfitItem.find(params[:id])
		outfit_item.destroy
		head 204
	end

	private
	def outfit_item_params
		params.require(:outfit_item).permit(:outfit_id, :item_id)
	end
end
