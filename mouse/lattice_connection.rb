# This module gives the mouse some extra functionality with Lattices.
module LatticeConnection
	# This method returns the first Lattice the Mouse sees. It is designed to read from Level.all.
	# @note 
	def current_lattice
		return unless on_any_in?
		sees_in_list.select { |thing| thing.type == :lattice }[0]
	end
	alias lattice current_lattice

	def on_lattice?
		!current_lattice.nil?
	end

	def highlight_lattice
		return unless on_lattice?
		current_lattice.update_highlights(location)
	end
	alias highlight highlight_lattice

	def delete_tile
		# Level.all.reject! { |tile| Level.all_tiles_with(:location, lattice.target_location).include? tile }
	end

	def change_tile(sprite_name)
		# Level.all_tiles_with(:location, lattice.target_location).each { |tile| tile.change_sprite!(sprite_name) }
	end

end