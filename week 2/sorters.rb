
require 'pry'
require 'benchmark'

class ReinersSorter
  def simple(arr = [], index = 0 )
    
    shorter_list = (index..arr.size).to_a
    min = shorter_list.min

    arr.delete(min)
    arr.insert(index, min)

    shorter_list.size == 1 ? arr : simple(index + 1)
  end

  def shift_sort(arr = [])
    min = arr.min
    arr.delete(min)
    return arr << min if arr.empty?
    [min] + shift_sort(arr)
  end

  def bubble_sort(arr = [])
    
    arr.each_with_index do |x, i|
      arr[i], arr[i + 1] = arr[i + 1], arr[i] if i < arr.size - 1 && arr[i] > arr[i + 1]
    end
    last = arr.delete(arr.last)
    return [last] if arr.empty?
    bubble_sort(arr) + [last]
  end

  def merge_sort(arr = [], elements = 1) 
    #Prepare the array for sorting in the first iteration
    arr = arr.each_slice(1).to_a if elements == 1 
    return_array = []
    finished = false
    arr.each_with_index do |sub_array, index|
      if index%2 == 0 || index == arr.length-1 && !finished 
        if index == arr.length-1 
          temp_array = []
          while sub_array.length > 0
            temp_array << sub_array.min
            sub_array.delete_at(sub_array.index(sub_array.min))
          end
          return_array << temp_array if temp_array.length>0
          finished = true
        else
          compare_array = arr[index+1]
          storage_sort = []
          until compare_array.length == 0 && sub_array.length == 0 
            compare_array[0] < sub_array[0] ? (storage_sort << compare_array.shift) : (storage_sort << sub_array.shift)
            if compare_array.length == 0 
              storage_sort << sub_array.shift while sub_array.length > 0
            elsif sub_array.length == 0 
              storage_sort << compare_array.shift while compare_array.length > 0
            end
          end
          return_array << storage_sort
        end
      end 
        finished = true if index == arr.length-2 
    end
      return_array.length == 1 ? (return return_array[0]) : (merge_sort(return_array, elements = 2))
  end 
end








