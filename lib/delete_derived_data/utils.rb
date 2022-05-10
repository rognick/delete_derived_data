
module DeleteDerivedData
  class Filesize
    def self.dirSize(path)
      File.size(path) + Dir["#{path}/**/*"].select { |f| File.file?(f) }.sum { |f| File.size(f) }
    end

    def self.size(size)
      units = ['B', 'KiB', 'MiB', 'GiB', 'TiB', 'Pib', 'EiB']

      return '0.0 B' if size == 0
      exp = (Math.log(size) / Math.log(1024)).to_i
      exp = 6 if exp > 6

      '%.1f %s' % [size.to_f / 1024 ** exp, units[exp]]
    end
  end
end
