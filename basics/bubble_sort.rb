# frozen_string_literal: true

def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    (n - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end

    break unless swapped
  end

  print array
end

my_array = [6, 3, 24, 4, 1, 9]
bubble_sort(my_array)
