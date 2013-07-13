# heap.rb

def remove_min(heap)
  return nil if heap.length.zero?
  if heap.length != 1
    heap[0] = heap.pop
    down_heapify(heap, 0)
  end
  return heap
end

def parent(i)
  (i-1) / 2
end

def left_child(i)
  2*i + 1
end

def right_child(i)
  2*i + 2
end

def leaf?(heap, i)
  left_child(i) >= heap.length && right_child(i) >= heap.length
end

def one_child?(heap, i)
  left_child(i) < heap.length && right_child(i) >= heap.length
end

def down_heapify(heap, i)
  return nil if leaf?(heap, i)
  if one_child?(heap, i) && heap[i] > heap[left_child(i)]
    heap[i], heap[left_child(i)] = heap[left_child(i)], heap[i]
  end
  return heap if heap[left_child(i), right_child(i)].min >= heap[i]
  if heap[left_child(i)] < heap[right_child(i)]
    heap[i], heap[left_child(i)] = heap[left_child(i)], heap[i]
    down_heapify(heap, left_child(i))
    return heap
  else
    heap[i], heap[right_child(i)] = heap[right_child(i)], heap[i]
    down_heapify(heap, right_child(i))
    return heap
  end

end

def build_heap(heap)
  heap.each { |e| down_heapify(heap, e) }
  return heap
end

def heap_sort(heap)
  while heap.length > 0
    puts heap[0]
    remove_min(heap)
  end
end

def test_heap
  h = [*0...10]
  build_heap(h)
  remove_min(h)
  puts 'h[0] == 1?', h[0] == 1
end

test_heap