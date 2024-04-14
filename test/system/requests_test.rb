require "application_system_test_case"

class RequestsTest < ApplicationSystemTestCase
  setup do
    @request = requests(:one)
  end

  test "visiting the index" do
    visit requests_url
    assert_selector "h1", text: "Requests"
  end

  test "should create request" do
    visit requests_url
    click_on "New request"

    fill_in "Document", with: @request.document
    fill_in "Fullname", with: @request.fullname
    fill_in "Request reason", with: @request.request_reason
    fill_in "Student number", with: @request.student_number
    click_on "Create Request"

    assert_text "Request was successfully created"
    click_on "Back"
  end

  test "should update Request" do
    visit request_url(@request)
    click_on "Edit this request", match: :first

    fill_in "Document", with: @request.document
    fill_in "Fullname", with: @request.fullname
    fill_in "Request reason", with: @request.request_reason
    fill_in "Student number", with: @request.student_number
    click_on "Update Request"

    assert_text "Request was successfully updated"
    click_on "Back"
  end

  test "should destroy Request" do
    visit request_url(@request)
    click_on "Destroy this request", match: :first

    assert_text "Request was successfully destroyed"
  end
end
