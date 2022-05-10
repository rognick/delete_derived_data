
require "find"
require "pathname"
require "tty-table"
require "tty-spinner"
require "delete_derived_data/trash"

require "tty-prompt"

module DeleteDerivedData
  class Delete
    def self.run(paths, options)
      if paths == nil || paths.length <= 0
        puts "No Data to be cleaning!"
        return nil
      end

      paths.each {|d| Trash.move_to_trash(d)}

      prompt = TTY::Prompt.new(enable_color: false, interrupt: :signal)
      answer = options[:trash] || prompt.yes?("Are you sure you want to empty the trash (this cannot be undone)?")
      return if !answer

      if options[:sempty]
        Trash.empty_securely_trash()
      else
        Trash.empty_trash()
      end
    end

  end
end
