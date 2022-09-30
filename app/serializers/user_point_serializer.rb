class UserPointSerializer
  def self.add_points(points)
    {
      'data': {
        'id': points.id,
        'attributes': {
          'payer': points.payer,
          'points': points.points
        }
      }
    }
  end

  def self.total_points(data)
    {
      'data': data
    }
  end

  def self.new_total(data)
    {
      'data': data
    }
  end
end