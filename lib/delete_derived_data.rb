
require "delete_derived_data/search"
require "delete_derived_data/delete"
require "delete_derived_data/version"

module DeleteDerivedData
  def self.delete(options = {})
    search = Search.new(options)
    derived_paths = search.getDerivedDatas
    archives_paths = search.getArchives if options[:archives]

    if !derived_paths.nil? && derived_paths.length > 0
      Delete.run(derived_paths, options)
    end

    if !archives_paths.nil? && archives_paths.length > 0
      Delete.run(archives_paths, options)
    end
  end
end
