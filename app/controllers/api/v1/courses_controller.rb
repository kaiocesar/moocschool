class Api::V1::CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def create
        head :ok
    end

    def update
    end

end
