array = [1, 29, 4, 7, 12]
dir = Dir.new('sample_dir')

p array.find_all { |number| number.odd? }
# [1, 29, 7]
p dir.find_all { |file_name| file_name.end_with? '.txt' }
# ["baz.txt", "foo.txt"]

p array.sort { |a, b| b <=> a }
# [29, 12, 7, 4, 1]
p dir.sort { |a, b| b <=> a }
# ["glarch.pdf", "foo.txt", "baz.txt", "bar.pdf", "..", "."]

p array.partition { |number| number.odd? }
# [[1, 29, 7], [4, 12]]
p dir.partition { |file_name| file_name.end_with? '.txt' }
# [["baz.txt", "foo.txt"], [".", "..", "bar.pdf", "glarch.pdf"]]


# Other methods shared by Dir and Array (and Hash,
# and File, and many others):
# all?, any?, chunk, chunk_while, collect, collect_concat,
# count, cycle,  detect, drop, drop_while, each_cons,
# each_entry, each_slice,  each_with_index,
# each_with_object, entries, find, find_all, find_index,
# first, flat_map, grep, grep_v, group_by, include?, inject,
# lazy, map, max,  max_by, member?, min, min_by, minmax,
# minmax_by, none?, one?, partition,  reduce, reject,
# reverse_each, select, slice_after, slice_before,
# slice_when,  sort, sort_by, take, take_while, to_a, to_h,
# to_set, zip
