class StudentsController < ApplicationController
    before_action :find_student, only: [:show, :update, :destroy]

    def index
        students = Student.all
        render json: students, status: :ok
    end

    def show
        render json: @student, status: :ok
    end

    def update
        @student.update!(student_params)
        render json: @student, status: :accepted
    end

    def create
        student = student.create!(student_params)
        render json: student, status: :created
    end

    def destroy
        @student.destroy
        render json: @student
        head :no_content
    end

    private

    def find_student
       @student = student.find(params[:id])
    end

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end
end
