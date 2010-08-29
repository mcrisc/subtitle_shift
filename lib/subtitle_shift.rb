# Dummy subtitle shifter
# Author: Marcelo Criscuolo

def to_milliseconds(time) 
	hours, minutes, seconds, milliseconds = time.scan(/\d+/).map {|d| d.to_i}

	(hours * 3600 + minutes * 60 + seconds) * 1000 + milliseconds
end

def to_timeformat(millis)
	milliseconds, sum = millis % 1000, millis / 1000
	hours, sum = sum / 3600, sum % 3600
	minutes, seconds = sum / 60, sum % 60
	
	format("%02d:%02d:%02d,%03d", hours, minutes, seconds, milliseconds)
end

def shift(file_in, file_out, offset)
	output = File.open(file_out, 'w')
	time_pattern = /^(\d{2}:\d{2}:\d{2},\d{3})[^\d:,]+(\d{2}:\d{2}:\d{2},\d{3}).*/
	File.open(file_in) do |file| 
		file.each_line do |line|
			line_out = line
			match = time_pattern.match(line)
			if match
				start_ms = to_milliseconds(match[1]) 
				finish_ms = to_milliseconds(match[2]) 
				start_ms += offset
				finish_ms += offset
				line_out = "#{to_timeformat(start_ms)} --> #{to_timeformat(finish_ms)}\n"
			end
			output.print line_out
		end
	end
	output.close
end

