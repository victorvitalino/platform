def address
  Address::Engine.routes.url_helpers
end

def attendance
  Attendance::Engine.routes.url_helpers
end
