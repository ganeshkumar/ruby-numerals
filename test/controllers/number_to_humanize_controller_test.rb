require 'test_helper'

  describe NumberToHumanizeController do
    it "for new action render a template" do
      get :new
      assert_template "new"
    end

    it "for show action with invalid integers return zero" do
      get :show, number: "@invalid", format: :js
      assert_equal "zero", assigns(:output)
      assert_template "show"
    end

    it "for show action with empty string return zero" do
      get :show, number: " ", format: :js
      assert_equal "zero", assigns(:output)
      assert_template "show"
    end

    it "for show action with valid integers return humanized format" do
      get :show, number: "5555", format: :js
      assert_equal "five thousand, five hundred and fifty-five", assigns(:output)
      assert_template "show"
    end

    it "for show action with decimals return integer humanized format" do
      get :show, number: "55.55", format: :js
      assert_equal "fifty-five", assigns(:output)
      assert_template "show"
    end

    it "for show action with negative numbers return humanized format" do
      get :show, number: "-5523", format: :js
      assert_equal "negative five thousand, five hundred and twenty-three", assigns(:output)
      assert_template "show"
    end

  end