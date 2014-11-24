class OutfitItem < ActiveRecord::Base
	belongs_to :outfit
	belongs_to :item
	validates_presence_of :outfit_id
	validates_presence_of :item_id
end
