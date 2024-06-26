# frozen_string_literal: true

# A module containing a reference to every sprite in the simple-mood sprite sheet included in DragonRuby.
#   Instead of one hash with 256 entries, I've split it into 16 hashes with 16 entries each.
module SpriteHash
  module_function

  # @return [Hash<Arrays>]
  def row_zero
    {
      null: [0, 0],
      w_smile: [1, 0],
      b_smile: [2, 0],
      heart: [3, 0],
      diamond: [4, 0],
      club: [5, 0],
      spade: [6, 0],
      bullet: [7, 0],
      inv_bullet: [8, 0],
      circle: [9, 0],
      inv_circle: [10, 0],
      male: [11, 0],
      female: [12, 0],
      eighth_note: [13, 0],
      beamed_eighth_notes: [14, 0],
      sun: [15, 0]
    }
  end

  # @return [Hash<Arrays>]
  def row_one
    {
      right_pointer: [0, 1],
      left_pointer: [1, 1],
      up_down_arrow: [2, 1],
      double_exclamation: [3, 1],
      pilcrow: [4, 1],
      section: [5, 1],
      rectangle: [6, 1],
      up_down_arrow_with_base: [7, 1],
      up_arrow: [8, 1],
      down_arrow: [9, 1],
      right_arrow: [10, 1],
      left_arrow: [11, 1],
      right_angle: [12, 1],
      left_right_arrow: [13, 1],
      up_triangle: [14, 1],
      down_triangle: [15, 1]
    }
  end

  # @return [Hash<Arrays>]
  def row_two
    {
      white_space: [0, 2],
      exclamation_point: [1, 2],
      quotes: [2, 2],
      hash: [3, 2],
      dollar: [4, 2],
      percent: [5, 2],
      ampersand: [6, 2],
      apostrophe: [7, 2],
      open_paren: [8, 2],
      close_paren: [9, 2],
      asterisk: [10,	2],
      plus: [11,	2],
      comma: [12,	2],
      dash: [13,	2],
      period: [14,	2],
      forward_slash: [15,	2]
    }
  end

  # @return [Hash<Arrays>]
  def row_three
    {
      zero: [0, 3],
      one: [1, 3],
      two: [2, 3],
      three: [3, 3],
      four: [4, 3],
      five: [5, 3],
      six: [6, 3],
      seven: [7, 3],
      eight: [8, 3],
      nine: [9, 3],
      colon: [10,	3],
      semicolon: [11,	3],
      less_than: [12,	3],
      equal_sign: [13,	3],
      greater_than: [14,	3],
      question_mark: [15,	3]
    }
  end

  # @return [Hash<Arrays>]
  def row_four
    {
      at: [0, 4],
      capital_a: [1, 4],
      capital_b: [2, 4],
      capital_c: [3, 4],
      capital_d: [4, 4],
      capital_e: [5, 4],
      capital_f: [6, 4],
      capital_g: [7, 4],
      capital_h: [8, 4],
      capital_i: [9, 4],
      capital_j: [10,	4],
      capital_k: [11,	4],
      capital_l: [12,	4],
      capital_m: [13,	4],
      capital_n: [14,	4],
      capital_o: [15,	4]
    }
  end

  # @return [Hash<Arrays>]
  def row_five
    {
      capital_p: [0, 5],
      capital_q: [1, 5],
      capital_r: [2, 5],
      capital_s: [3, 5],
      capital_t: [4, 5],
      capital_u: [5, 5],
      capital_v: [6, 5],
      capital_w: [7, 5],
      capital_x: [8, 5],
      capital_y: [9, 5],
      capital_z: [10,	5],
      open_bracket: [11,	5],
      back_slash: [12,	5],
      close_bracket: [13,	5],
      caret: [14,	5],
      underscore: [15,	5]
    }
  end

  # @return [Hash<Arrays>]
  def row_six
    {
      tick: [0, 6],
      lowercase_a: [1, 6],
      lowercase_b: [2, 6],
      lowercase_c: [3, 6],
      lowercase_d: [4, 6],
      lowercase_e: [5, 6],
      lowercase_f: [6, 6],
      lowercase_g: [7, 6],
      lowercase_h: [8, 6],
      lowercase_i: [9, 6],
      lowercase_j: [10,	6],
      lowercase_k: [11,	6],
      lowercase_l: [12,	6],
      lowercase_m: [13,	6],
      lowercase_n: [14,	6],
      lowercase_o: [15,	6]
    }
  end

  # @return [Hash<Arrays>]
  def row_seven
    {
      lowercase_p: [0, 7],
      lowercase_q: [1, 7],
      lowercase_r: [2, 7],
      lowercase_s: [3, 7],
      lowercase_t: [4, 7],
      lowercase_u: [5, 7],
      lowercase_v: [6, 7],
      lowercase_w: [7, 7],
      lowercase_x: [8, 7],
      lowercase_y: [9, 7],
      lowercase_z: [10,	7],
      open_brace: [11,	7],
      split_bar: [12,	7],
      close_brace: [13,	7],
      tilde: [14,	7],
      home: [15,	7]
    }
  end

  # @return [Hash<Arrays>]
  def row_eight
    {
      capital_ç: [0, 8],
      capital_ü: [1, 8],
      lowercase_é: [2, 8],
      lowercase_â: [3, 8],
      lowercase_ä: [4, 8],
      lowercase_à: [5, 8],
      lowercase_å: [6, 8],
      lowercase_ç: [7, 8],
      lowercase_ê: [8, 8],
      lowercase_ë: [9, 8],
      lowercase_è: [10,	8],
      lowercase_î: [11,	8],
      lowercase_ï: [12,	8],
      lowercase_ì: [13,	8],
      capital_ä: [14,	8],
      capital_å: [15,	8]
    }
  end

  # @return [Hash<Arrays>]
  def row_nine
    {
      capital_é: [0, 9],
      lowercase_ashe: [1, 9],
      capital_ashe: [2, 9],
      lowercase_ô: [3, 9],
      lowercase_ö: [4, 9],
      lowercase_ò: [5, 9],
      capital_û: [6, 9],
      lowercase_ù: [7, 9],
      lowercase_ÿ: [8, 9],
      capital_ö: [9, 9],
      capital_ü: [10,	9],
      cent: [11,	9],
      pound: [12,	9],
      yen: [13,	9],
      peseta: [14,	9],
      lowercase_ƒ: [15,	9]
    }
  end

  # @return [Hash<Arrays>]
  def row_ten
    {
      lowercase_á: [0, 10],
      lowercase_í: [1, 10],
      lowercase_ó: [2, 10],
      lowercase_ú: [3, 10],
      lowercase_ñ: [4, 10],
      capital_ñ: [5, 10],
      ordinal_indicator_fem: [6, 10],
      ordinal_indicator_masc: [7, 10],
      inv_question_mark: [8, 10],
      back_not: [9, 10],
      not: [10, 10],
      half: [11,	10],
      quarter: [12,	10],
      inv_exclamation_point: [13,	10],
      open_angle_quotes: [14,	10],
      close_angle_quotes: [15,	10]
    }
  end

  # @return [Hash<Arrays>]
  def row_eleven
    {
      light_shade: [0, 11],
      medium_shade: [1, 11],
      dark_shade: [2, 11],
      vertical_bar: [3, 11],
      vertical_left: [4, 11],
      vertical_double_left: [5, 11],
      double_vertical_left: [6, 11],
      double_down_left: [7, 11],
      down_double_left: [8, 11],
      double_vertical_double_left: [9, 11],
      double_vertical: [10, 11],
      double_down_double_left: [11, 11],
      double_up_double_left: [12, 11],
      double_up_left: [13, 11],
      up_double_left: [14, 11],
      down_left: [15, 11]
    }
  end

  # @return [Hash<Arrays>]
  def row_twelve
    {
      up_right: [0, 12],
      up_horizontal: [1, 12],
      down_horizontal: [2, 12],
      vertical_right: [3, 12],
      horizontal: [4, 12],
      vertical_horizontal: [5, 12],
      vertical_double_right: [6, 12],
      double_vertical_right: [7, 12],
      double_up_double_right: [8, 12],
      double_down_double_right: [9, 12],
      double_up_double_horizontal: [10, 12],
      double_down_double_horizontal: [11, 12],
      double_vertical_double_right: [12, 12],
      double_horizontal: [13, 12],
      double_vertical_double_horizontal: [14, 12],
      up_double_horizontal: [15, 12]
    }
  end

  # @return [Hash<Arrays>]
  def row_thirteen
    {
      double_up_horizontal: [0, 13],
      down_double_horizontal: [1, 13],
      double_down_horizontal: [2, 13],
      double_up_right: [3, 13],
      up_double_right: [4, 13],
      down_double_right: [5, 13],
      double_down_right: [6, 13],
      double_vertical_horizontal: [7, 13],
      vertical_double_horizontal: [8, 13],
      up_left: [9, 13],
      down_right: [10, 13],
      solid_block: [11, 13],
      bottom_slab: [12, 13],
      left_slab: [13, 13],
      right_slab: [14, 13],
      up_slab: [15, 13]
    }
  end

  # @return [Hash<Arrays>]
  def row_fourteen
    {
      alpha: [0, 14],
      beta: [1, 14],
      gamma: [2, 14],
      pi: [3, 14],
      sigma: [4, 14],
      lowercase_sigma: [5, 14],
      mu: [6, 14],
      tau: [7, 14],
      phi: [8, 14],
      theta: [9, 14],
      omega: [10, 14],
      delta: [11, 14],
      infinity: [12, 14],
      lowercase_phi: [13, 14],
      epsilon: [14, 14],
      intersection: [15, 14]
    }
  end

  # @return [Hash<Arrays>]
  def row_fifteen
    {
      identical: [0, 15],
      plus_or_minus: [1, 15],
      greater_than_or_equal_to: [2, 15],
      less_than_or_equal_to: [3, 15],
      top_half_intergral: [4, 15],
      bottom_half_intergral: [5, 15],
      divide: [6, 15],
      approximate: [7, 15],
      degree: [8, 15],
      multiply: [9, 15],
      dot: [10, 15],
      radical: [11, 15],
      nth_power: [12, 15],
      squared: [13, 15],
      square: [14, 15],
      no_break_space: [15, 15]
    }
  end

  # This will let you call any sprite by name.
  # @return [Hash<Arrays>]
  def all
    row_zero.merge(row_one,
                   row_two,
                   row_three,
                   row_four,
                   row_five,
                   row_six,
                   row_seven,
                   row_eight,
                   row_nine,
                   row_ten,
                   row_eleven,
                   row_twelve,
                   row_thirteen,
                   row_fourteen,
                   row_fifteen)
  end

  # This allows the module to be used as a Hash itself.
  # @param sprite_name_symbol [Symbol]
  # @return [Array<Integers>]
  def [](sprite_name_symbol)
    all[sprite_name_symbol]
  end
end
