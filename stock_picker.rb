class StockPicker
  # loop through days array i.e. [17,3,6,9,15,8,6,1,10]
  # find best buy / sell day combo i.e. index 1, 4 would give us a profit of 12
  # answer returned is an array with buy index, sell index and profit made

  def stock_picker(arr)
    min = arr.min
    max = arr.max
    min_index = arr.index(min)
    max_index = arr.index(max)
    answer = []

    # this is best case
    if min_index < max_index
      p [min_index, max_index, max - min]
      return [min_index, max_index, max - min]
    end

    arr.each_with_index do |day, index|

      if index >= arr.length - 1
        return answer
      end

      # diff between day and min of future days
      max_future_day_value = arr[index..-1].max
      difference = max_future_day_value - arr[index]
      answer = [index, arr.find_index(max_future_day_value), difference] if (answer.length < 1 || answer[-1] < difference)
    end
  end
end
