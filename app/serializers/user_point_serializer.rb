class UserPointSerializer
  def self.add_points(points)
    {
      'data': {
        'id': 'points.id',
        'attributes': {
          'payer': 'points.payer',
          'points': 'points.points'
        }
      }
    }
  end
end