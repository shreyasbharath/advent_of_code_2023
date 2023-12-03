#!/usr/bin/env ruby

$WORD_TO_INTEGER_HASH = {
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9
}.freeze

def normalise_calibration_values(values)
  values.map { |value| $WORD_TO_INTEGER_HASH.fetch(value, value) }
end

def parse_calibration_value(input, index)
  regex = Regexp.union(Regexp.union($WORD_TO_INTEGER_HASH.keys), Regexp.union($WORD_TO_INTEGER_HASH.values.map(&:to_s)))
  puts regex
  raw_numbers = input.scan(regex)
  normalised_numbers = normalise_calibration_values(raw_numbers)

  calibration = [normalised_numbers[0], normalised_numbers[-1]].join.to_i

  puts("#{index + 1} #{input} #{normalised_numbers}, calibration = #{calibration}")
  calibration
end

def read_calibration_document(filename)
  IO.read(filename)
end

def get_calibration_value(calibration_doc)
  calibration_doc.lines.map.with_index { |value, index| parse_calibration_value(value.strip, index) }.reduce(:+)
end

calibration_doc = read_calibration_document('input')
sum = get_calibration_value(calibration_doc)

puts(sum)
