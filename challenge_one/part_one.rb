#!/usr/bin/env ruby

def parse_calibration_value(input)
  numbers = input.scan(/\d/).map(&:to_i)
  value = [numbers[0], numbers[-1]].join.to_i
  puts(value)
  value
end

def read_calibration_document(filename)
  IO.read(filename)
end

def get_calibration_value(calibration_doc)
  calibration_doc.lines.map { |value| parse_calibration_value(value) }.reduce(:+)
end

calibration_doc = read_calibration_document('input')
sum = get_calibration_value(calibration_doc)

puts(sum)
