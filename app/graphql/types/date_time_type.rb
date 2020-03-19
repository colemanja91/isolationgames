class Types::DateTimeType < Types::BaseScalar

  def self.coerce_input(value, _ctx)
    Time.zone.parse(value)
  end
  def self.coerce_result(value, _ctx)
    if value.class.eql? Date
      value.to_datetime.utc.iso8601
    else
      value&.utc&.iso8601
    end
  end
end
