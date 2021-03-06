require 'user'


describe User do

  

describe '.all' do
  it 'saves user details in a database' do
    user = User.create(username: "Namast-Jay", password:"password123", email: "jaydamasta@hotmail.com")
    users = [user]
    expect(users.first).to be_a User
    expect(users.first.id).to eq user.id
    expect(users.first.username).to eq('Namast-Jay')
    expect(users.first.email).to eq('jaydamasta@hotmail.com')
  end

end

describe '.create' do
  it 'user is created with username, password and email' do
    user = User.create(username: "Namast-Jay", password:"password123", email: "jaydamasta@hotmail.com")
    expect(user).to be_a User
    expect(user.username).to eq('Namast-Jay')
    expect(user.email).to eq('jaydamasta@hotmail.com')
  end
end

describe '.findproperties' do
    it 'returns all the properties owned by logged in user' do
      user = User.create(username: "Namast-Jay", password:"password123", email: "jaydamasta@hotmail.com")
      property = Property.add(
        ownerID: '1',
        title: 'Cool test house',
        address: '64 zoo lane',
        description: "It is a house and it is really cool but it is also just a test",
        picture: 'www.pictureofacoolhouse.com',
        ppn: 50,
        start_date: '2020-01-01',
        end_date: '2020-02-01')
      properties = User.findproperties(user.id)
      expect(properties[0].title).to include 'Cool test house'
    end
  end


end
