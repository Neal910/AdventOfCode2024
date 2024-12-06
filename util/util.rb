class Util

  def self.read_file(file)
    list = []
    File.foreach(file) do |line|
      list << line.split.map(&:to_i)
    end
    list
  end

  def self.parse_characters_to_2d_array(file_path)
    result = []
    File.foreach(file_path).with_index do |line, row_index|
      line.strip.chars.each_with_index do |char, col_index|
        result[row_index] ||= []
        result[row_index][col_index] = char
      end
    end
    result
  end

  def self.write_2d_list_to_file(list, file_path)
    File.open(file_path, "w") do |file|
      list.each do |row|
        file.puts row.join("")
      end
    end
  end
end
