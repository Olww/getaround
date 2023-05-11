module Level3
  class CommissionsCalculationService
    attr_reader :price, :rental_days

    def initialize(price, rental_days)
      @price = price
      @rental_days = rental_days
    end

    def call
      raise ArgumentError.new("The car pricing is not correct") if rental_days * 100 > commission / 2
      data
    rescue ArgumentError => e
      puts e.message
      {}
    end

    private

    def assistance_fee
      @assistance_fee ||= (rental_days * 100).to_i
    end

    def commission
      @commission ||= (price * 0.3).to_i
    end

    def drivy_fee
      @drivy_fee ||= commission - insurance_fee - assistance_fee
    end

    def insurance_fee
      @insurance_fee ||= (commission / 2).to_i
    end

    def data
      { insurance_fee: insurance_fee, assistance_fee: assistance_fee, drivy_fee: drivy_fee }
    end
  end
end
