
require "delete_derived_data/search"
require "delete_derived_data/delete"
require "delete_derived_data/version"

module DeleteDerivedData
  def self.delete(options = {})
    search = Search.new(options)
    derived_paths = search.getDerivedDatas
    archives_paths = search.getArchives if options[:archives]

    if !derived_paths.nil? && derived_paths.length > 0
      puts "derived_paths"
      # Delete.run(derived_paths, options)
    end

    if !archives_paths.nil? && archives_paths.length > 0
      puts "archives_paths"
      # Delete.run(archives_paths, options)
    end
  end

  def self.have_full_disk_access
    cmd = "$(sw_vers -productVersion | cut -d . -f 1) -lt 11 ] && [ $(sw_vers -productVersion | cut -d . -f 2) -lt 15"
    system( cmd )
    
    cmd = "sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db 'select * from access' > /dev/null 2>&1 && true || false"
    wasGood = system( cmd )
    puts wasGood
  end
end
