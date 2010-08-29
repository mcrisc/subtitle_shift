require 'test/unit'
require 'lib/subtitle_shift'

class ConversionToMillisTest < Test::Unit::TestCase
	def test_zero
		assert_equal(0, to_milliseconds('00:00:00,000'))
	end

	def test_one_millisecond
		assert_equal(1, to_milliseconds('00:00:00,001'))
	end

	def test_a_second
		assert_equal(1000, to_milliseconds('00:00:01,000'))
	end

	def test_a_minute
		assert_equal(60_000, to_milliseconds('00:01:00,000'))
	end

	def test_an_hour
		assert_equal(3_600_000, to_milliseconds('01:00:00,000'))
	end

	def test_complex_value
		assert_equal(5027679, to_milliseconds('01:23:47,679'))
	end
end

class ConversionToFormattedTest < Test::Unit::TestCase
	def test_zero
		assert_equal('00:00:00,000', to_timeformat(0))
	end

	def test_one_millisecond
		assert_equal('00:00:00,001', to_timeformat(1))
	end

	def test_a_second
		assert_equal('00:00:01,000', to_timeformat(1000))
	end

	def test_a_minute
		assert_equal('00:01:00,000', to_timeformat(60_000))
	end

	def test_an_hour
		assert_equal('01:00:00,000', to_timeformat(3_600_000))
	end

	def test_complex_value
		assert_equal('01:23:47,679', to_timeformat(5027679))
	end
end

class InverseFunctionTest < Test::Unit::TestCase
	def test_zero
		assert_equal('00:00:00,000', to_timeformat(to_milliseconds('00:00:00,000')))
	end

	def test_one_millisecond
		assert_equal('00:00:00,001', to_timeformat(to_milliseconds('00:00:00,001')))
	end

	def test_a_second
		assert_equal('00:00:01,000', to_timeformat(to_milliseconds('00:00:01,000')))
	end

	def test_a_minute
		assert_equal('00:01:00,000', to_timeformat(to_milliseconds('00:01:00,000')))
	end

	def test_an_hour
		assert_equal('01:00:00,000', to_timeformat(to_milliseconds('01:00:00,000')))
	end

	def test_complex_value
		assert_equal('01:23:47,679', to_timeformat(to_milliseconds('01:23:47,679')))
	end
end

