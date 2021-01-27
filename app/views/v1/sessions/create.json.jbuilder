json.data do
  json.user do
    json.call(
      @user,
      :email,
      :authentication_token
    )
  end
  json.reservations do
    json.call(
      @userReservations,
      :date
    )
  end
end
