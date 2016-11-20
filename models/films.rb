require('pg')
require_relative('../runner')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @price =  options['price'].to_f
    @id = options['id'].to_i
  end
  
  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{price}) returning *;"
    films = SqlRunner.run(sql)
    @id = films[0]['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ('#{title}', #{price}) WHERE id = #{@id};"
    return SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = #{id};"
    return SqlRunner.run(sql)
  end

  def customers()
    sql = "SELECT c.* FROM customers c INNER JOIN tickets t ON c.id = customer_id WHERE film_id = #{@id};"
    return Customer.get_many(sql)
  end

  def popular_film_time
    # sql = "SELECT film_time FROM tickets WHERE film_id = #{@id};"
    # films = SqlRunner.run(sql)
    # film_times = []
    # # binding.pry
    # result = films.each {|hash| film_times << hash}
    # return film_times

    sql = "SELECT film_time COUNT FROM tickets WHERE film_id = #{@id} GROUP BY film_time ORDER BY COUNT (*) DESC;"
    result = SqlRunner.run(sql)
    return result[0]

  end

  def ticket_limit(film)
    sql = "SELECT * FROM tickets WHERE film_id = #{@id} LIMIT 2;"
    result= Ticket.get_many(sql)
    # binding.pry
    unless film.customers.count >= result.count 
      Tickets.save 
    end
    return Ticket.all
  end

  def self.all
    sql = "SELECT * FROM films;"
    return self.get_many(sql)
  end

  def self.delete_all
    sql = "DELETE FROM films;"
    return SqlRunner.run(sql)
  end

  def self.get_many(sql)
    films = SqlRunner.run(sql)
    return films.map {|film| Film.new(film)}
  end


end