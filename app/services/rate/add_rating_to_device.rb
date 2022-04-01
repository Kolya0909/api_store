module Rate
  class AddRatingToDevice

    def initialize(device_id)
      @device_id = device_id
    end

    def call
      calc_new_rate_device
    end

    private

    def calc_new_rate_device
      @device = Device.find(@device_id)
      @device.rating = get_rate_device[:rates]/get_rate_device[:size]
      @device.save
    end

    def get_rate_device
      rates = Rating.where(device_id: @device_id)
      res = rates.map do |rate|
        rate.rate
      end
      {
        rates: res.sum,
        size: res.size
      }
    end

  end
end
