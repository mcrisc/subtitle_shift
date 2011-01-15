require 'lib/subtitle_shift'

module SubtitleShift
  class Cli < Thor
    include Thor::Actions

    namespace :subtitle

    desc "shift OFFSET FILEPATH", "move the subtitles forward in time"
    def shift(offset, file_path)
      say_status(:backup, "creating .bak copy")
      File.rename(file_path, "#{file_path}.bak")
      say_status(:shifting, "#{offset}ms")
      ::SubtitleShift::Shifter.shift("#{file_path}.bak", file_path, offset.to_i)
    end

    desc "unshift OFFSET FILEPATH", "move the subtitles backward in time"
    def unshift(offset, file_path)
      say_status(:backup, "creating .bak copy")
      File.rename(file_path, "#{file_path}.bak")
      say_status(:unshifting, "-#{offset}ms")
      ::SubtitleShift::Shifter.shift("#{file_path}.bak", file_path, offset.to_i * -1)
    end
  end
end
