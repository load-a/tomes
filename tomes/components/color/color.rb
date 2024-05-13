# frozen_string_literal: true

# A class that contains hashes with color data.
module Color
  module_function

  # A list of all colors in this class (except #test_color).
  # @return [Array<Hash>]
  def all
    [
      pink,	cyan,
      brown,	dark_brown,
      red,	dark_red,
      orange, 				dark_orange,
      yellow, 				dark_yellow,
      green, 					dark_green,
      blue,	dark_blue,
      purple,	indigo,
      black,	grey,	white,	background
    ]
  end

  # See #all
  # @return [Array<Symbol>]
  def all_names
    all.map { |color_hash| color_hash[:color_name] }
  end

  # The default background white.
  # @return [Hash]
  def background
    rgb = [230, 230, 230]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :background,
      color_id: 1
    }
  end

  # Pure white.
  # @return [Hash]
  def white
    rgb = [255, 255, 255]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :white,
      color_id: 2
    }
  end

  # @return [Hash]
  def grey
    rgb = [178, 178, 178]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :grey,
      color_id: 3
    }
  end

  # @return [Hash]
  def black
    rgb = [0, 0, 0]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :black,
      color_id: 4
    }
  end

  # @return [Hash]
  def pink
    rgb = [255, 77, 128]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :pink,
      color_id: 5
    }
  end

  # @return [Hash]
  def cyan
    rgb = [22, 244, 208]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :cyan,
      color_id: 6
    }
  end

  # @return [Hash]
  def brown
    rgb = [206, 129, 71]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :brown,
      color_id: 7
    }
  end

  # @return [Hash]
  def dark_brown
    rgb = [86, 29, 37]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :dark_brown,
      color_id: 8
    }
  end

  # @return [Hash]
  def red
    rgb = [239, 39, 27]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :red,
      color_id: 9
    }
  end

  # @return [Hash]
  def dark_red
    rgb = [113, 0, 0]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :dark_red,
      color_id: 10
    }
  end

  # @return [Hash]
  def yellow
    rgb = [252, 186, 4]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :yellow,
      color_id: 11
    }
  end

  # @return [Hash]
  def dark_yellow
    rgb = [100, 69, 54]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :dark_yellow,
      color_id: 12
    }
  end

  # @return [Hash]
  def orange
    rgb = [230, 127, 13]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :orange,
      color_id: 13
    }
  end

  # @return [Hash]
  def dark_orange
    rgb = [172, 57, 49]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :dark_orange,
      color_id: 14
    }
  end

  # @return [Hash]
  def green
    rgb = [47, 191, 113]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :green,
      color_id: 15
    }
  end

  # @return [Hash]
  def dark_green
    rgb = [36, 62, 54]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :dark_green,
      color_id: 16
    }
  end

  # @return [Hash]
  def blue
    rgb = [60, 145, 230]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :blue,
      color_id: 17
    }
  end

  # @return [Hash]
  def dark_blue
    rgb = [1, 22, 56]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :dark_blue,
      color_id: 18
    }
  end

  # @return [Hash]
  def purple
    rgb = [138, 79, 255]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :purple,
      color_id: 19
    }
  end

  # @return [Hash]
  def indigo
    rgb = [57, 20, 99]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :indigo,
      color_id: 20
    }
  end

  # @param r [Integer] Red value.
  # @param g [Integer] Green value.
  # @param b [Integer] Blue value.
  # @return [Hash]
  def test_color(r, g, b)
    rgb = [r, g, b]

    {
      r: rgb[0],
      g: rgb[1],
      b: rgb[2],
      color_name: :test,
      color_id: 0
    }
  end
end
