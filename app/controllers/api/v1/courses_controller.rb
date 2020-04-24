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
    end

end
