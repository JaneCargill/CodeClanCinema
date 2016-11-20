require('pg')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @funds = options['funds'].to_f
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{funds}) returning *;"
    customer = SqlRunner.run(sql)
    @id = customer[0]['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ('#{name}', #{funds}) WHERE id = #{@id};"
    return SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{id};"
    return SqlRunner.run(sql)
  end

  def tickets()
    sql = "SELECT * FROM tickets WHERE customer_id = #{@id};"
    tickets = SqlRunner.run(sql)
    return tickets.map {|ticket| Ticket.new(ticket)}
  end

  def ticket_prices()
    sql = "SELECT f.price FROM films f INNER JOIN tickets t ON f.id = t.film_id WHERE customer_id = #{@id}"
    cost = Film.get_many(sql)
  end

  def buy_ticket(film)
    @funds -= film.price
    update()
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    return self.get_many(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    return SqlRunner.run(sql)
  end

  def self.get_many(sql)
    customers = SqlRunner.run(sql)
    return customers.map {|customer| Customer.new(customer)}
  end
    

end