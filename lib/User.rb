class User
  @user_id
  @integration_id
  @login_id
  @password
  @first_name
  @last_name
  @full_name
  @sortable_name
  @short_name
  @email
  @pronouns
  @status

  def set_name(name)
    n = name.split(" ")
    @first_name = n.shift
    @last_name = "#{n.shift} #{n.shift}".strip
    @full_name = name
    @sortable_name = name
    @short_name = @first_name
  end

  def set_sis(sis_id)
    @user_id = sis_id
    @login_id = sis_id
    @password = sis_id
  end

  def set_email(email_domain)
    @email = "#{@user_id}@#{email_domain}"
  end

  def get_csv_format
    csv_string = "#{@user_id},#{@integration_id},#{@login_id},#{@password},#{@first_name},#{@last_name},#{@full_name},#{@sortable_name},#{@short_name},#{@email},#{@pronouns},#{@status}"
    return csv_string
  end

end
