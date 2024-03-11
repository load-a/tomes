class Level
	@@all = []

	class << self
		def all
			@@all
		end

		def every(thing_class)
			all.select { |thing| thing.kind_of? thing_class }
		end

		def actors(exception: nil)
			return every(Actor) if exception.nil?
			every(Actor).reject { |actor| actor == exception }
		end

		def tiles(exception: nil)
			return every(Tile) if exception.nil?
			every(Tile).reject { |tile| tile == exception }
		end


		def delete!(thing)
			all.reject! {|entry| entry == thing}
		end

		def delete_every!(thing_class)
			all.reject! {|entry| entry.kind_of? thing_class}
		end


		def render_order
			[
				Lattice,
				Highlighter,
				Actor,
				Tile
			].reverse
		end

		def all_primitives
			all.sort_by { |thing|
				render_order.index(thing.class)
			}
		end


		def export
			all.map { |thing|
				thing.creation_data
			}
		end

		def formatted_info
			'Lvl (%d)' % [all.length]
		end
		alias info formatted_info

	end

end