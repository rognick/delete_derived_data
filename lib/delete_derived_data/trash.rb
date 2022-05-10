
module DeleteDerivedData
  class Trash
    def self.move_to_trash(file)
      puts "Telling Finder to move the file #{file} to trash... "
      IO.popen("osascript", "w") do |stdin|
        stdin.puts %Q{tell app "Finder" to move the POSIX file "#{file}" to trash}
      end
    end

    def self.empty_trash
      puts "Telling Finder to empty trash... "
      IO.popen("osascript", "w") do |stdin|
        stdin.puts %Q{tell app "Finder" to empty trash}
      end
    end

    def self.empty_securely_trash
      puts "Telling Finder to securely empty trash... "
      IO.popen("osascript", "w") do |stdin|
        stdin.puts %Q{tell app "Finder" to empty trash with security}
      end
    end

  end
end
