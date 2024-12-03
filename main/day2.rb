require_relative "../util/util"

file_path = "resource/day2.txt"

def is_increasing?(report)
  (1...report.length).each do |i|
    return false if report[i-1] > report[i - 1]
    diff = report[i] - report[i-1]
    return false if diff < 1 || diff > 3
  end
  true
end

def is_decreasing?(report)
  (1...report.length).each do |i|
    return false if report[i-1] < report[i]
    diff = report[i-1] - report[i]
    return false if diff < 1 || diff > 3
  end
  true
end

def count_safe_reports(file_path)
  safe_reports_count = 0
  
  reports = Util.read_file(file_path)
  reports.each do |report|
    if is_increasing?(report) || is_decreasing?(report)
      safe_reports_count += 1
    else
      (0...report.length).each do |i|
        modified_report = report[0...i] + report[(i + 1)..-1]
        if is_increasing?(modified_report) || is_decreasing?(modified_report)
          safe_reports_count += 1
          break
        end
      end
    end
  end

  safe_reports_count
end


puts count_safe_reports(file_path)
