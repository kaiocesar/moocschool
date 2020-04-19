json.courses @courses.each do |course|
    json.id course.id
    json.name course.name
    json.titration course.titration
    json.amount_periods_months course.amount_periods_months
    json.workload course.workload
end