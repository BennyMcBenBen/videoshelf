require File.dirname(__FILE__) + '/../test_helper'
require 'video_library_controller'

# Re-raise errors caught by the controller.
class VideoLibraryController; def rescue_action(e) raise e end; end

class VideoLibraryControllerTest < Test::Unit::TestCase
  def setup
    @controller = VideoLibraryController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
