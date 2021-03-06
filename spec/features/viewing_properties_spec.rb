feature 'viewing properties' do

  feature 'user can' do

    scenario 'view a property' do
      Property.add(
      ownerID: 5,
      title: 'Cool test house',
      address: '64 zoo lane',
      description: "It is a house and it is really cool but it is also just a test",
      picture: 'http://remodelarsyil.co/wp-content/uploads/2019/01/cool-houses-designs-cool-house-designs-cool-house-design-ideas-house-designs-ideas-cool-house-designs.jpg',
      ppn: 50,
      start_date: '2020-01-01',
      end_date: '2020-02-01')
      
      sign_up
      log_in
      
      expect(page).to have_content('Welcome, testusername')

      expect(page).to have_content('Cool test house')
      expect(page).to have_css("img[src*='http://remodelarsyil.co/wp-content/uploads/2019/01/cool-houses-designs-cool-house-designs-cool-house-design-ideas-house-designs-ideas-cool-house-designs.jpg']")

      expect(page).to have_content('It is a house and it is really cool but it is also just a test')
      expect(page).to have_content('64 zoo lane')
      expect(page).to have_content('£50')
      expect(page).to have_button('Book now')
      expect(page).to have_content('2020-01-01')
      expect(page).to have_content('2020-02-01')

    end

  end


end
