require "date_to_word/version"

module DateToWord
  def self.to_words(value)
    value_length = value.to_s.split('.')
    value_r = value_length[0]
    value_p = value_length[1]
    a = []
    p = []
    words = []
    value_r.split('').each do |i|
      a << i
    end

    if value_p
      value_p.split('').each do |j|
        p << j
      end
    end

    a = a.reverse
    p = p.reverse
    result = to_units(a[0], a[1])
    result = to_tens(a[0], a[1]) unless result
    h_result = to_units(a[2])
    t_result = to_units(a[3], a[4])
    t_result = to_tens(a[3], a[4]) unless t_result
    l_result = to_units(a[5], a[6])
    l_result = to_tens(a[5], a[6]) unless l_result
    c_result = to_units(a[7], a[8])
    c_result = to_tens(a[7], a[8]) unless c_result
    p_result = to_units(p[0], p[1])
    p_result  = to_tens(p[0], p[1]) unless p_result

    # if you want to extend it beyond crore you can add your code here.

    words << "#{c_result} crore " if c_result && c_result != 'zero'
    words << "#{l_result} lakh " if l_result && l_result != 'zero'
    words << "#{t_result} thousand " if t_result && t_result != 'zero'
    words << "#{h_result} hundred " if h_result && h_result != 'zero'
    words << "#{result} " if result && result != 'zero'
    words << "and #{p_result} paise " if p_result && p_result != 'zero'
    # words << "only."
    return words.join
  end

  def self.to_units(u=nil, t=nil)
    tens = "#{t}#{u}".to_i
    digits[tens]
  end

  def self.to_tens(u=nil, t=nil)
    "#{digits[t.to_i*10]} #{digits[u.to_i]}"
  end

  def self.digits
    @digits ||= {
      0 => 'zero',
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      10 => 'ten',
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen',
      20 => 'twenty',
      30 => 'thirty',
      40 => 'fourty',
      50 => 'fifty',
      60 => 'sixty',
      70 => 'seventy',
      80 => 'eighty',
      90 => 'ninety'
    }
  end

  def self.date_to_words(date)
    d = date.strftime("%d-%B-%Y")
    d_arr = d.split("-")
    d_arr[0] = self.to_words(d_arr[0].to_i).capitalize
    d_arr[2] = self.years_to_words(d_arr[2].to_i).capitalize
    d_arr.join(" ")
  end
  def self.years_to_words(y)
    year = y.to_s
    cents = year[0..1].to_s.to_i
    years = year[2..4].to_s.to_i

    cents_in_words = {
      19=>"Nineteen",
      20=>"Two Thousand ",
      21=>"Twenty one",
      22=>"Twenty two"

    }
    a  = {
      0=>"",
      1=>:one,
      2=>:two,
      3=>:three,
      4=>:four,
      5=>:five,
      6=>:six,
      7=>:seven,
      8=>:eight,
      9=>:nine,
      10=>:ten,
    }
    teens={
      10=>:ten,
      11=>:eleven,
      12=>:twleve,
      13=>:thirteen,
      14=>:fourteen,
      15=>:fifteen,
      16=>:sixteen,
      17=>:seventeen,
      18=>:eighteen,
      19=>:nineteen,
    }
    tens_words = {
      2=>:twenty,
      3=>:thirty,
      4=>:fourty,
      5=>:fifty,
      6=>:sixty,
      7=>:seventy,
      8=>:eighty,
      9=>:ninety,
    }

    hundreds = "#{cents_in_words[cents]}"

    if years == 0 && cents ==19
      tens =  "hundred"
    elsif years<10 && years >0 && cents ==19
      tens =  "hundred and #{a[years]}"
    elsif years<10 && years >0 && cents > 19
      tens = "and #{a[years]}"
    elsif years<20
      tens = "#{teens[years]}"
    else
      tens = "#{tens_words[years/10]}#{a[years%10]}"
    end

    year_in_words = "#{hundreds} #{tens}"

    return "#{year_in_words}"
  end
end
