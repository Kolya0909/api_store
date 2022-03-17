module ErrorMod
  class ApiError

    def initialize(status, massage)
      @status = status
      @massage = massage
    end

    def self.send_err
      {'status'=>@status, 'massage'=>@massage}
    end

  end
end
