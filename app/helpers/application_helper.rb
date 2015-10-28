module ApplicationHelper
  def users_list
    @query = Person::Staff.includes(:sector_current).status(true).order(:name)
    @query.each do |u|
      yield u
    end
  end

  def local_users_list

   @user_current = current_user.account
   if @user_current.sector_current.present?
     @user_current.sector_current.staffs.status(true).order(:name).each do |ul|
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

  def my_order_service
    @user_id = current_user.id
    @my_order = Helpdesk::OrderService.where(staff_id: @user_id)
    @my_order.each do |z|
       yield z
    end
  end
end
