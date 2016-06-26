require_relative '../sorters/sorters.rb'
require 'benchmark'
array_100_sorted = (1..100).to_a
array_500_sorted = (1..500).to_a
array_2_000_sorted = (1..2_000).to_a
array_5_000_sorted = (1..5_000).to_a
array_10_000_sorted = (1..10_000).to_a

array_100_unsorted = (1..100).to_a.sort_by{rand}
array_500_unsorted = (1..500).to_a.sort_by{rand}
array_2_000_unsorted = (1..2_000).to_a.sort_by{rand}
array_5_000_unsorted = (1..5_000).to_a.sort_by{rand}
array_10_000_unsorted = (1..10_000).to_a.sort_by{rand}

sorted = [array_100_sorted, array_500_sorted, array_2_000_sorted, array_5_000_sorted, array_10_000_sorted]
unsorted = [array_100_unsorted, array_500_unsorted, array_2_000_unsorted, array_5_000_unsorted, array_10_000_unsorted]



sorter = ReinersSorter.new

unsorted.each do |array|
  
  puts "#{array.length} records"

  Benchmark.bm do |x|
    x.report("merge:")   { sorter.merge_sort(array) }
    x.report("bubble:") { sorter.bubble_sort(array) }
    x.report("simple:")  { sorter.simple(array) }
    x.report("ruby core:")  { array.sort! }
  end

end