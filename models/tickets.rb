require('pg')

class Ticket

  attr_accessor :customer_id, :film_id, :film_time
  attr_reader :id

  def initialize(options)
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @id = options['id'].to_i
    @film_time = options['film_time']
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id, film_time) VALUES (#{@customer_id}, #{@film_id}, '#{@film_time}') returning *;"
    tickets = SqlRunner.run(sql)
    @id = tickets[0]['id'].to_i
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = #{@id};"
    return SqlRunner.run(sql)
  end


  def self.all
    sql = "SELECT * FROM tickets;"
    return self.get_many(sql)
  end

  def self.delete_all
    sql = "DELETE FROM tickets;"
    return SqlRunner.run(sql)
  end

  def self.get_many(sql)
    tickets = SqlRunner.run(sql)
    return tickets.map {|ticket| Ticket.new(ticket)}
  end

end