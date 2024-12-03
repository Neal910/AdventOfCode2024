class Util

  def self.read_file(file)
    list = []
    File.foreach(file) do |line|
      list << line.split.map(&:to_i)
    end
    list
  end
end
