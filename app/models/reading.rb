class Reading < ActiveRecord::Base
	belongs_to :patient

	after_create :create_block_chain 

	def create_block_chain
		self.update_column(:blockchain_hash, Block.first("#{self.reading_value}-#{self.created_at}").transactions_hash)
	end
end
