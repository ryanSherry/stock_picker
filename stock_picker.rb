class StockPicker
  # loop through days array i.e. [17,3,6,9,15,8,6,1,10]
  # find best buy / sell day combo i.e. index 1, 4 would give us a profit of 12
  # answer returned is a hash with buy index, sell index and profit made

  # @param [Object] arr
  # @return [Object] hash
  def stock_picker(arr)
    arr.each_with_object({}) do |day, answer|
      max_future_day_value = arr[arr.find_index(day)..-1].max
      max_future_day_index = arr.find_index(max_future_day_value)
      difference = max_future_day_value - day
      next unless answer.empty? || answer[:profit] < difference

      answer[:buy] = arr.find_index(day)
      answer[:sell] = max_future_day_index
      answer[:profit] = difference
    end
  end
end
