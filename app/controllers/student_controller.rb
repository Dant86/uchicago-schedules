class StudentController < ApplicationController
  before_action :authenticate_user!
  def index; end

  def times
    id = params[:section]
    if Section.exists?(id)
      @times = Section.find(id).times
    else
      @times = ''
    end
  end

  def course_list
    id = params[:dept]
    @courses = Department.exists?(id) ? Department.find(id).courses : []
  end

  def section_list
    id = params[:course]
    @sections = Course.exists?(id) ? Course.find(id).sections : []
  end

  def add_course
    dept = params[:dept]
    @department = Department.exists?(dept) ? Department.find(dept) : Department.create(name: dept)
    course = params[:course]
    @course = @department.courses.exists?(course) ? @department.courses.find(course) : @department.courses.create(name: course)
    section = params[:section]
    @section = @course.sections.exists?(section) ? @course.sections.find(section) : @course.sections.create(number: section)
    @section.times = params[:times]
    @section.save
    UserSection.find_or_create_by(user: current_user, section: @section)
    redirect_to action: :index
  end
end
