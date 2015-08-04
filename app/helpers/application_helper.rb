module ApplicationHelper
  def link_to_nav(param, param2)
  end

  def users_list
    @query = Person::Staff.includes(:sector_current).all.order(:name)
    @query.each do |u|
      yield u
    end
  end

  def local_users_list
    @user_current = current_user.account
    if @user_current.sector_current.present?
      @sector = Person::Sector.find(@user_current.sector_current_id)
      @sector.staffs.each do |u|
        yield u
      end
    end
  end
end
