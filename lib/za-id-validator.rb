module ZaIdValidator

  def valid_za_identity_number?(id)
    id = id.to_s # force to a string
    return false unless length_is_valid?(id)
    id.chars.to_a.last == z(id).to_s[-1]
  end

  private

    def length_is_valid?(id)
      id =~ /^\d{13}$/
    end

    def a(id)
      id.chars.to_a.values_at(0,2,4,6,8,10).inject(0) { |sum, v| sum += v.to_i }
    end

    def b(id)
      id.chars.to_a.values_at(1,3,5,7,9,11).join
    end

    def c(id)
      (b(id).to_i * 2).to_s.chars.to_a.inject(0) { |sum, v| sum += v.to_i }
    end

    def d(id)
      a(id) + c(id)
    end

    def z(id)
      10 - (d(id) % 10)
    end

end