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
   byebug
   if @user_current.sector_current.present?
     @user_current.sector_current.staffs.each do |ul|
        yield ul
      end
    end
  end

  def profile_users(id_sector)
    @query_avatar = Person::Staff.where(sector_current_id:id_sector)

    @query_avatar.each do |qa|

      yield qa
    end
  end

end
