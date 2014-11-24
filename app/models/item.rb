class Item < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :user_id

	def as_json(options={})
		options[:except] ||= [:created_at, :updated_at, :user_id]
		super(options)
	end
end
