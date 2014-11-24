class OutfitsController < ApplicationController
	
	def create
		outfit = Outfit.new(outfit_params)
		outfit.user_id = @user.id
		if outfit.save
			render json: outfit, status: 201
		else
			render json: outfit.errors, status: 422
		end
	end

	def show
		outfit = find_outfit
		render json: outfit.as_json, status: 200
	end

	def update
		outfit = find_outfit
		if outfit.update(outfit_params)
			render json: outfit.as_json, status: 200
		end
	end

	def destroy
		outfit = find_outfit
		outfit.destroy
		head 204
	end

	def index
		render json: @user.outfits.as_json(:include => {:items => {:except => [:created_at, :updated_at, :user_id]}}), status: 200
	end

	def find_outfit
		Outfit.find(params[:id])
	end

	private
	def outfit_params
		params.require(:outfit).permit(:name, :date_worn)
	end
end
