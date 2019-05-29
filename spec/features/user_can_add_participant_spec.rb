require "rails_helper"

# As a registered user
# Who has created a vacation
# When I visit the vacation I created, 'owner/vacation/1'
# I see a link to Add Participants
# When I click this link, I am taken to '/owner/vacation/1/invite'
# There, I can enter the email address of multiple users that I would
# like to invite to my vacation

describe 'vacation owner' do
  it 'can add participants' do
    user = create(:user, dwolla_id: "1234567", dwolla_funding_source: "ASD-123-ASDK-134")
    miami = Vacation.create!(name: "spring break", location: "Miami", start_date: 18.days.from_now, end_date: 30.days.from_now)
    v_u = VacationUser.create!(role: 1, user_id: user.id, vacation_id: miami.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit owner_vacation_path(miami)
# save_and_open_page
    click_button "Invite Participants"

    expect(current_path).to eq(owner_vacation_invite_path(miami))
# save_and_open_page
    invites = "vacaypay1234@gmail.com, vacaypay.turing@gmail.com"
    fill_in :email_invitations, with: invites
    click_on "Save"

    expect(current_path).to eq(owner_vacation_path(miami))
    expect(page).to have_content('Successfully sent invitations!')
  end
end