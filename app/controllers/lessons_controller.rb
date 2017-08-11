class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user_enrollment_for_lesson, only: [:show]

  def show
  end

  private
  
  def require_user_enrollment_for_lesson
    if current_user.enrolled_in?(current_lesson.section.course) != true
    # if current_lesson.section.course.enrollments.include?(current_user) != true
    # if current_user.enrolled_in?(current_lesson.section.course) != true || current_user.enrollments.nil? == true 
      redirect_to course_path(current_lesson.section.course), alert: 'Please Enroll to Access Lessons'
    end
  end
 
  helper_method :current_lesson

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end