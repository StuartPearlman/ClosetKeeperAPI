class Outfit < ActiveRecord::Base
	belongs_to :user
	has_many :outfit_items, dependent: :destroy
	has_many :items, through: :outfit_items
	validates_presence_of :user_id
	validates_presence_of :name

	def as_json(options={})
		options[:except] ||= [:created_at, :updated_at, :user_id]
		super(options)
	end
end