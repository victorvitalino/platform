module ApplicationHelper
  def link_to_nav(param, param2)
  end

  def users_list
    @query = Person::Staff.all.order(:name)
    @query.each do |u|
      yield u
    end
  end

  def local_users_list
    @user_current = current_user.account
    if @user_current.sector_current.present?
      @user_current.sector_current.staffs.each do |u|
        yield u
      end
    end
  end
end
