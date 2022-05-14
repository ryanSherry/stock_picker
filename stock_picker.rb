class StockPicker
  # loop through days array i.e. [17,3,6,9,15,8,6,1,10]
  # find best buy / sell day combo i.e. index 1, 4 would give us a profit of 12
  # answer returned is an array with buy index, sell index and profit made

  # @param [Object] arr
  # @return [Object]
  def stock_picker(arr)
    answer = {}

    # this is best case if the min comes before the max
    return [arr.index(arr.min), arr.index(arr.max), arr.max - arr.min] if arr.index(arr.min) < arr.index(arr.max)

    arr.each_with_index do |day, index|

      return answer if index >= arr.length - 1

      # diff between day and min of future days
      max_future_day_value = arr[index..-1].max
      difference = max_future_day_value - arr[index]
      if answer.empty? || answer[:profit] < difference
        answer = { buy: index, sell: arr.find_index(max_future_day_value),
                   profit: difference }
      end
    end
    answer
  end
end
