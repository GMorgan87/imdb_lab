require_relative("../db/sql_runner")

class Star

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
  end

  def save()
    sql = "INSERT INTO stars
    (first_name, last_name)
    values
    ($1, $2)
    RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i
  end

  def delete()
    sql = "DELETE FROM stars WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM stars"
    stars = SqlRunner.run(sql)
    return stars.map {|star| Star.new(star)}
  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end


end
