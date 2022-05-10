
require "delete_derived_data/utils"

module DeleteDerivedData
  class Search
    attr_accessor :verbose, :root_dir

    def initialize(options = {})
      @verbose  = options[:verbose]
      @root_dir = options[:root_dir] || ENV["HOME"]
    end

    def to_s
      "#{verbose} #{root_dir}"
    end

    def getDerivedDatas

      directory_paths = get_directory_paths(root_dir)
      derived_paths = []
      threads = []

      table = TTY::Table.new(["Directory paths to be search"], directory_paths.map { |f| [f] })
      puts table.render(:ascii)

      directory_paths.each do |folder|
        threads << Thread.new {
          begin
            Find.find(folder, ignore_error: true) {|path| derived_paths << path if path =~ /.*\DerivedData$/}
          rescue Exception => e
            puts e.message
          end
        }
      end

      spinner = TTY::Spinner.new("[:spinner] Search Derived Data ...", format: :dots_2)
      spinner.auto_spin

      threads.each {|t| t.join}

      derived_size = 0
      data = [:separator]
      derived_paths.each { |d|
        size = Filesize.dirSize(d)
        derived_size = derived_size + size
        data << [d, Filesize.size(size)] if verbose
      }
      data << :separator
      data << ["Derived Data total size", Filesize.size(derived_size)]

      spinner.stop

      table = TTY::Table.new(["DerivedData", "Size"], data)
      puts table.render(:ascii, alignments: [:left, :right], padding: [0,1,0,1])

      derived_paths

    end

    def getArchives

      spinner = TTY::Spinner.new("[:spinner] Search Xcode Archives ...", format: :dots_2)
      spinner.auto_spin

      xcode_archives = []
      data = []
      xcode_archives_size = 0

      data << :separator
      Dir["#{ENV["HOME"]}/Library/Developer/Xcode/Archives/**"].select { |d|
        size = Filesize.dirSize(d)
        xcode_archives_size = xcode_archives_size + size
        data << [d, Filesize.size(size)] if verbose
        xcode_archives << d
      }
      data << :separator
      data << ["Xcode Archives total size", Filesize.size(xcode_archives_size)]

      spinner.stop

      table = TTY::Table.new(["Xcode Archives", "Size"], data)
      puts table.render(:ascii, alignments: [:left, :right], padding: [0,1,0,1])

      xcode_archives

    end

    private

    def get_directory_paths(root_dir)
      Pathname.new(root_dir).children.select { |c|
        c.directory? && c.zero? == false && c.blockdev? == false && c.basename.to_s[0] != '.'
      }
    end
  end

end
