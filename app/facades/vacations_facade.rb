class VacationsFacade
  def initialize(vacation_id)
    @vacation_id = vacation_id
  end

  def vacation_name
    vacation.name
  end

  def vacation_host
    vacation.host.first_name
  end

  def attending_activities(user)
    ids = activities(user).pluck(:activity_id)
    Activity.find(ids)
  end

  def paid?(activity, user)
    #this is incorrect

    #there are multiple users on an activity so doing find_by
    #finds the first activity not necessarily whether the current_user
    #has 'settled up'

    #try
    UserActivity.where(activity_id: activity.id).find_by(user_id: user.id).paid?
    # UserActivity.find_by(activity_id: activity.id).paid?
  end

  def outstanding_balance(user)
    activities(user).where(paid: false).sum(:price)
  end

  private

  def activities(user)
    UserActivity.where(user_id: user.id)
  end

  def vacation
    @vacation ||= Vacation.find(@vacation_id)
  end

end
