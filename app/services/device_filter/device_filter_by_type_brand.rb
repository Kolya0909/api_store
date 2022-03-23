module DeviceFilter

  class DeviceFilterByTypeBrand

    def initialize(params)
      @params = params
    end

    def call
      return if @params.nil?
      if @params[:brand_id]
        filter_by_brand
      elsif @params[:type_id]
        filter_by_type
      elsif @params[:brand_id]&& @params[:type_id]
        filter_by_type_and_brand
      else
        get_all_device
      end
    end

    private

    def filter_by_brand
      Device.where(brand_id: @params[:brand_id])
    end

    def filter_by_type
      Device.where(type_id: @params[:type_id])
    end

    def filter_by_type_and_brand
      Device.where(brand_id: @params[:brand_id],type_id: @params[:type_id])
    end

    def get_all_device
      Device.all
    end

  end
end

