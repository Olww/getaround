class Option
  attr_reader :id, :type, :rental_id

  def initialize(attributes)
    @id = attributes[:id]
    @type = attributes[:type]
    @rental_id = attributes[:rental_id]
  end
end
