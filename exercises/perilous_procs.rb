# Phase 1
def some?(array, &prc)
  count = 0
  array.each { |el| count += 1 if prc.call(el) }
  count > 0
end

def exactly?(array, n, &prc)
  count = 0
  array.each { |el| count += 1 if prc.call(el) }
  count == n
end

def filter_out(array, &prc)
  result = []
  array.each { |el| result << el if !prc.call(el) }
  result
end

def at_least?(array, n, &prc)
  count = 0
  array.each { |el| count += 1 if prc.call(el) }
  count >= n
end

def every?(array, &prc)
  count = 0
  array.each { |el| count += 1 if prc.call(el) }
  count == array.length
end

def at_most?(array, n, &prc)
  count = 0
  array.each { |el| count += 1 if prc.call(el) }
  count <= n
end

def first_index(array, &prc)
  result = ''
  array.each do |el|
    if prc.call(el)
      result = el
      break
    end
  end
  array.index(result)
end

# Phase 2
def xnor_select(array, prc1, prc2)
  array.select { |i| (prc1.call(i) & prc2.call(i)) || (!prc1.call(i) & !prc2.call(i)) }
end

def filter_out!(array, &prc)
  array.select! { |el| !prc.call(el) }
end

def multi_map(array, n = 1, &prc)
  array.map do |el|
    n.times { el = prc.call(el) }
    el
  end
end

def proctition(array, &prc)
  true_array = []
  false_array = []
  array.each { |el| prc.call(el) ? true_array << el : false_array << el }
  true_array + false_array
end

# Phase 3
def selected_map!(array, prc1, prc2)
  array.map! do |el|
    if prc1.call(el)
      prc2.call(el)
    else
      el
    end
  end
  nil
end

def chain_map(val, *prcs)
  value = val
  procs = prcs[0]
  procs.each do |prc|
    value = prc.call(value)
  end
  value
end

def proc_suffix(sent, hash)
  result = []
  sent.split.each do |word|
    suffix = []
    hash.each do |prc, v|
      suffix << v if prc.call(word)
    end
    result << word + suffix.join
  end
  result.join(' ')
end

def proctition_platinum(array, *prcs)
  hash = {}
  (1..prcs.size).each do |i|
    hash[i] = []
  end
  array.each do |el|
    prcs.each_with_index do |prc, idx|
      if prc.call(el)
        hash[idx+1] << el
        break
      end
    end
  end
  hash
end

def procipher(sentence, cipher)
    words = sentence.split(' ')
    new_words = words.map do |word|
        new_word = word
        cipher.each do |checker, changer|
            new_word = changer.call(new_word) if checker.call(word)
        end
        new_word
    end
    new_words.join(' ')
end

def picky_procipher(sentence, cipher)
    words = sentence.split(' ')
    new_words = words.map do |word|
        key_procs = cipher.keys
        matches = key_procs.select { |prc| prc.call(word) }
        if matches.length >= 1
            key_proc = matches.first
            value_proc = cipher[key_proc]
            value_proc.call(word)
        else
            word
        end
    end
    new_words.join(' ')
end
