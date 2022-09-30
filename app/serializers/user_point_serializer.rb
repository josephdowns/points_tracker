class UserPointSerializer
  def self.add_points(points)
    {
      'data': {
        'id': points.id,
        'attributes': {
          'payer': points.payer,
          'points': points.points,
          'created_at': points.created_at
        }
      }
    }
  end

  def self.total_points(data)
    {
      'data': data
    }
  end
end