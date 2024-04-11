module InputLists
	def letters 
		[
			:a, :b, :c, :d, :e, :f, :g,
			:h, :i, :j, :k, :l, :m, :n, :o, :p,
			:q, :r, :s,
			:t, :u, :v,
			:w, :x,
			:y, :z,

			:comma, :period, :exclamation_mark, :question_mark, :colon, :semicolon,
			:less_than, :greater_than, :equal, 
			:space, :enter, :shift, :tab, :backspace,

			:meta, :alt, :control,
			:forward_slash, :back_slash,

			:open_square_brace, :close_square_brace, :open_round_brace, :close_round_brace, 
			:single_quotation_mark, :double_quotation_mark
		]
	end

	def numbers 
		{
			one: 1,
			two: 2,
			three: 3,
			four: 4,
			five: 5,
			six: 6,
			seven: 7,
			eight: 8,
			nine: 9,
			zero: 0
		}
	end

	def directions 
		{
			up: [:up_arrow, :w],
			down: [:down_arrow, :s],
			left: [:left_arrow, :a],
			right: [:right_arrow, :d]
		}
	end

	def buttons 
		{
			A: [:c, :j],
			B: [:x, :k],
			X: [:z, :l],
			Y: [:shift, :semicolon],
			START: :enter,
			SELECT: :space
		}.merge(directions)
	end

	def confirm_buttons 
		{
			yes: [:j, :enter, :c],
			no: [:k, :x]
		}
	end

	def keys
		letters + numbers.keys + directions + buttons + confirm_buttons 
	end
end