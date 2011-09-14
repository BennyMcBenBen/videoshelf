require File.dirname(__FILE__) + '/../test_helper'
require 'online_video_controller'

# Re-raise errors caught by the controller.
class OnlineVideoController; def rescue_action(e) raise e end; end

class OnlineVideoControllerTest < Test::Unit::TestCase
  fixtures :online_videos

  def setup
    @controller = OnlineVideoController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = online_videos(:first).id
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

    assert_not_nil assigns(:online_videos)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:online_video)
    assert assigns(:online_video).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:online_video)
  end

  def test_create
    num_online_videos = OnlineVideo.count

    post :create, :online_video => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_online_videos + 1, OnlineVideo.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:online_video)
    assert assigns(:online_video).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      OnlineVideo.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      OnlineVideo.find(@first_id)
    }
  end
end
