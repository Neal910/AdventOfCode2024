class Util

  def self.read_file(file)
    list = []
    File.foreach(file) do |line|
      list << line.split.map(&:to_i)
    end
    list
  end

  def self.parse_letters_to_2d_array(file_path)
    result = []

    File.foreach(file_path).with_index do |line, row_index|
      line.strip.chars.each_with_index do |char, col_index|
        result[row_index] ||= []
        result[row_index][col_index] = char
      end
    end

    result
  end
end
