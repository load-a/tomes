# @note The Stack-based functionality is experimental so it has been commented out.

require 'app/tomes/components/selector/acquire.rb'
require 'app/tomes/components/selector/relinquish.rb'
require 'app/tomes/components/selector/query.rb'
# require 'app/tomes/components/selector/acquire.rb'

class Selector
	extend Identifiable
	include Identity

	include Acquire
	include Relinquish
	include Query
	# include StackManipulation

	set_class_tag("SEL")

	attr_writer :possession, :memory, :stack

	def initialize
		set_id

		self.possession = nil	# for objects
		self.memory = nil			# for data

		# self.stack = []
	end

	public attr_reader :possession, :memory, :stack

	def info 
		{
			self: self,
			id: id_tag,
			has: @possession,
			remembers: @memory,
			stack: stack
		}
	end

	def formatted_info
		"%<id>s - h: %<has>s | r: %<remembers>s | s: %<stack>s" % info
	end

end