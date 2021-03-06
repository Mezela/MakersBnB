require_relative 'choose_database'
require 'pg'

class Property

  attr_reader :id, :ownerID, :title, :address, :description, :picture, :ppn, :start_date, :end_date

  def initialize(
    id:,
    ownerID:,
    title:,
    address: ,
    description:,
    picture:,
    ppn:,
    start_date:,
    end_date:
  )
    @id = id
    @ownerID = ownerID
    @title = title
    @address = address
    @description = description
    @picture = picture
    @ppn = ppn
    @start_date = start_date
    @end_date = end_date
  end

  def self.view_all
    connection = PG.connect(dbname: which_database)
    sql = 'SELECT * FROM properties'
    result = connection.exec(sql)
    @results = result.map do |property|
      Property.new(
        id: property['id'],
        ownerID: property['ownerid'],
        title: property['title'],
        address: property['address'],
        description: property['description'],
        picture: property['picture'],
        ppn: property['ppn'],
        start_date: property['start_available_date'],
        end_date: property['end_available_date']
      )
    end
  @results
  end

  def self.access_via_id(id)
    connection = PG.connect(dbname: which_database)
    sql = "SELECT * FROM properties WHERE id=#{id}"
    result = connection.exec(sql)
    results = result.map do |property|
      property = Property.new(
        id: result[0]['id'],
        ownerID: result[0]['ownerid'],
        title: result[0]['title'],
        address: result[0]['address'],
        description: result[0]['description'],
        picture: result[0]['picture'],
        ppn: result[0]['ppn'],
        start_date: result[0]['start_available_date'],
        end_date: result[0]['end_available_date']
      )
    end
    return results[0]
  end


  def self.add(
    ownerID:,
    title:,
    address:,
    description:,
    picture:,
    ppn:,
    start_date:,
    end_date:)
    connection = PG.connect(dbname: which_database)

    sql = "INSERT INTO properties (ownerID, title, address, description, picture, ppn, start_available_date, end_available_date) VALUES('#{ownerID}','#{title}', '#{address}', '#{description}','#{picture}','#{ppn}','#{start_date}','#{end_date}');"
    begin
      connection.exec(sql)
    rescue
      return 'unique error'
    end
  end
end
