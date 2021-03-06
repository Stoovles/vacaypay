require 'rails_helper'

describe 'as a registered user that has connected with a dwolla funding source' do
  it 'can create a new vacation' do
    user = create(:user, dwolla_id: "1234567", dwolla_funding_source: "ASD-123-ASDK-134")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    click_link "+ Create a Vacation"

    expect(current_path).to eq(new_users_vacation_path)
    expect(page).to have_content("Create a New Vacation")

    fill_in :Name, with: "Family Reunion"
    fill_in :City, with: "Miami"
    fill_in :State, with: "FL"
    fill_in :Country, with: "US"
    fill_in 'Start date', with: 100.days.from_now
    fill_in 'End date', with: 107.days.from_now

    click_button "Create Vacation"
    vacation = Vacation.last

    expect(current_path).to eq(owner_vacation_path(vacation))
    expect(page).to have_content("#{vacation.name} has been created!")
    expect(page).to have_button("Add an Activity")
    expect(page).to have_button("Invite Participants")

    visit vacations_path
    expect(page).to have_content(vacation.name)
    expect(page).to have_content(vacation.city)
    expect(page).to have_content(vacation.start_date.strftime("%m/%d/%Y"))
    expect(page).to have_content(vacation.end_date.strftime("%m/%d/%Y"))

    vacation_users = VacationUser.last
    expect(vacation_users.role).to eq(1)
    expect(vacation_users.user_id).to eq(user.id)
    expect(vacation_users.vacation_id).to eq(vacation.id)
  end

  it 'will not create a vacation with missing information' do
    user = create(:user, dwolla_id: "1234567", dwolla_funding_source: "ASD-123-ASDK-134")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    click_link "+ Create a Vacation"

    expect(current_path).to eq(new_users_vacation_path)
    expect(page).to have_content("Create a New Vacation")


    click_button "Create Vacation"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Start date can't be blank")
    expect(page).to have_content("End date can't be blank")
  end
end
