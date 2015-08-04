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
<<<<<<< HEAD
    @user_current = current_user.account
    if @user_current.sector_current.present?
      @sector = Person::Sector.find(@user_current.sector_current_id)
      @sector.staffs.each do |u|
        yield u
=======
   @user_current = current_user.account
   if @user_current.sector_current.present?
     @user_current.sector_current.staffs.each do |ul|
        yield ul
>>>>>>> 7b0a456581587ebf80956019df9ea284fed38c0c
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
