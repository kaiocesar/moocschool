class Api::V1::CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def create
        @newCourse = Course.new(
            name: params[:name],
            titration: params[:titration],
            amount_periods_months: params[:amount_periods_months],
            workload: params[:workload],
        )
        @newCourse.save!
        head :ok
    end

    def update
        course = Course.find_by(params[:id])
        if course
            course.name = params[:name]
            course.titration = params[:titration]
            course.amount_periods_months = params[:amount_periods_months]
            course.workload = params[:workload]
            course.save!
        end
        head :ok
    end

end
