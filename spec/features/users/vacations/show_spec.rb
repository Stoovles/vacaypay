require 'rails_helper'

describe 'as a registered user' do
  describe 'who has been invited to a vacation' do
    it 'shows all of the activities that I am attending' do
      user = User.create(first_name: "Participant", last_name: "Name", email: "email@email.com", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      owner = User.create!(first_name: "Owner", last_name: "Name", email: "owner@email.com", password: "password")
      vacation = Vacation.create(name: "Family Reunion", location: "Florida", start_date: 10.days.from_now, end_date: 15.days.from_now)
      owner.vacation_users.create!(role: 1, vacation: vacation)
      user.vacation_users.create(role: 0, vacation: vacation)
      activity_1 = Activity.create(name: "Kayaking", price: 20.0, num_attendees: 1, description: "It'll be fun.", no_of_days: 1, vacation: vacation, user: owner)
      user_activity_1 = user.user_activities.create!(quantity: 1, price:20.0, activity: activity_1)
      activity_2 = Activity.create(name: "Dinner", price: 15.0, num_attendees: 1, description: "Nom nom", no_of_days: 1, vacation: vacation, user: owner)
      user_activity_2 = user.user_activities.create!(quantity: 1, price:15.0, activity: activity_2)

      visit dashboard_path
      click_link(vacation.name)

      expect(current_path).to eq(vacation_path(vacation))
      expect(page).to have_content(vacation.name)
      within "#activity-#{activity_1.id}" do
        expect(page).to have_content(activity_1.name)
        expect(page).to have_content(activity_1.price)
        expect(page).to have_button("Settle Up")
      end
      expect(page).to have_content("Total Owed: $35.00")
    end
  end
end
