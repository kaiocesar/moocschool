class Api::V1::CoursesController < ApplicationController
    def index
        @courses = Course.all
    end
end
