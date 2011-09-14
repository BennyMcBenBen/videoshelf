require File.dirname(__FILE__) + '/../test_helper'
require 'package_controller'

# Re-raise errors caught by the controller.
class PackageController; def rescue_action(e) raise e end; end

class PackageControllerTest < Test::Unit::TestCase
  fixtures :packages

  def setup
    @controller = PackageController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = packages(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:packages)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:package)
    assert assigns(:package).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:package)
  end

  def test_create
    num_packages = Package.count

    post :create, :package => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_packages + 1, Package.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:package)
    assert assigns(:package).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Package.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Package.find(@first_id)
    }
  end
end
