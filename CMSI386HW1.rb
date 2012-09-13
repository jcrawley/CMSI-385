require 'generator'

#1.
	def strip_vowells(str)
		return str.delete'aeiouAEIOU'
	end

#2
	def scramble(str)
		return st. split(//).shuffle.join
	end
	
#3
	def powers_of_two(limit)
		g = Generator.new do |x|
			base = 0;
			while 2 ** base < limit
				x.yield 2 ** base
				base += 1;
			end
		end
		while !g.end?
			yield g.next
		end
	end
	
#4
	def powers(base, limit)
		g = Generator.new do |x|
			count = 0
			while base ** count < limit
				x.yield base ** count
				count += 1;
			end
		end
	
		while !g.end?
			yield g.next
		end
	end

#5
	def interleave(a,b)
		longer = smaller = []
		a.size > b.size ? longer = a : longer = b
		a.size > b.size ? smaller = b : smaller = a #can't figure how to shorten this
		return a.zip(b).flatten.concat(longer[smaller.size..longer.size])

	end
	
#6
	class Array
		def stutter
			result = []
   		 	for n in self
   		 		result.push n
    			result.push n
    		end
    		return result
		end
	end

#7
	for i in 0..ARGV[0].size
		puts ARGV[0][0,i]
	end

#8
	count = 0
	file= File.new(ARGV[0])
	while  line = file.gets
		if line[0] != "" || line[0] != "#"
			count+= 1
		end
	end
	puts count
#9


require 'test/unit'
require 'misc.rb'

class String
  def is_permutation_of(other)
    self.split(//).sort == other.split(//).sort
  end
end

class TestUtil < Test::Unit::TestCase

  def test_strip_vowels()
    assert_equal(strip_vowels(""), "");
    assert_equal(strip_vowels("ouT"), "T");
    assert_equal(strip_vowels("aeT"), strip_vowels("ioT"))
    assert_equal(strip_vowels("AEHIAEIOU"), strip_vowels("aeHIaeiou"))
    assert_equal(strip_vowles("why"), strip_vowels("why"))
  end

  def test_scramble()
    ["", "a", "aaaa", "aaba", "abfswegwtewr"].each do |s|
      assert(s.is_permutation_of(scramble(s)))
    end
    assert(!"abc".is_permutation_of(scramble("aab")))
  end

  def test_powers_of_two()
    # TODO
  end

  def test_powers()
    # TODO
  end

  def test_interleave()
    assert_equal(interleave([1, 2], [nil, 5, 7, 10]), [1, nil, 2, 5, 7, 10])
   	assert_equal(interleave([1,2,3], [1,2,3]), [1,1,2,2,3,3])
   	assert_equal(interleave([1,3,5,7,9], [2,4,6]), [1,2,3,4,5,6,7,9])
   	assert_equal(interleave(["ray"], ["toal"]), ["ray", "toal"])
   	assert_equal(interleave(["r","a","y"], ["t","o","a","l"]), ["r", "t", "a","o","y","a", "l"])
  end

  def test_stutter()
    assert_equal([1, 1].stutter, [1, 1, 1, 1])
    assert_equal([[1],1].stutter, [[1],[1],1,1])
    assert_equal(["ray","toal"].stutter, ["ray", "ray", "toal", "toal"])
    assert_equal(["",""].stutter, ["","","",""])
  end

end