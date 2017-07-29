require 'rails_helper'
require 'devise'

describe PrototypesController do
  let(:user) { create(:user) }
  let(:prototype) { create(:prototype, user: user)}

  describe "login user" do
    before do
      login_user user
    end

    describe "GET #edit" do
      it "assigns the requested prototype to @prototype" do
        get :edit, id: prototype
        expect(assigns(:prototype)).to eq prototype
      end

      it "renders the :edit template" do
        get :edit, id: prototype
        expect(response).to render_template :edit
      end

      it "assigns main_image to @main_image" do
        get :edit, id: prototype
        expect(assigns(:main_image)).to eq prototype.capture_images.main.first
      end

      it "assigns sub_image to @sub_image" do
        get :edit, id: prototype
        expect(assigns(:sub_image)).to eq prototype.capture_images.sub.first
      end
    end
  end
end

