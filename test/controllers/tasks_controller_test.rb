require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "deberia ser redirigido a la pagina de login si no esta autenticado" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should get new when user is logged in" do
    sign_in users(:one)
    get :new
    assert_response :success
  end
  
  test "should not create a task without login" do
      assert_no_difference('Task.count') do
          post :create, task: { state: @task.state, title: @task.title, user_id: @task.user_id }
      end

    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
  
  test "should create task" do
    sign_in users(:one)
    assert_difference('Task.count') do
    post :create, task: { state: @task.state, title: @task.title, user_id: @task.user_id }
  end
 
     assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    patch :update, id: @task, task: { state: @task.state, title: @task.title, user_id: @task.user_id }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
