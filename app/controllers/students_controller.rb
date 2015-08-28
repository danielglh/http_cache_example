class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.order(updated_at: :desc).all

    ##################################################################
    # Code Snippet 1
    # Uncomment to change Cache-Control header to:
    # Cache-Control: max-age=86400, public, must_revalidate
    ##################################################################
    # expires_in 1.day, public: true, must_revalidate: true

    ##################################################################
    # Code Snippet 2
    # Uncomment to change Cache-Control header to:
    # Cache-Control: max-age=10, public, must_revalidate
    ##################################################################
    # expires_in 10.seconds, public: false, must_revalidate: true

    ##################################################################
    # Code Snippet 3
    # Uncomment to make the response stale immediately
    # Cache-Control: no-cache
    ##################################################################
    # expires_now

    ##################################################################
    # Code Snippet 4
    # Uncomment to stop generating cached copy at all
    # Cache-Control: no-store
    ##################################################################
    # headers['Cache-Control'] = 'no-store'

    ##################################################################
    # Code Snippet 5
    # Uncomment the following code to specify revalidation rule
    ##################################################################
    # fresh_when(etag: @students, last_modified: @students.first.updated_at)

    ##################################################################
    # Code Snippet 6
    # Uncomment the following code to specify revalidation rule
    ##################################################################
    # if stale?(etag: @students, last_modified: @students.first.updated_at)
    #   render :student_index
    # end
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :age, :status, :major, :year)
    end
end
