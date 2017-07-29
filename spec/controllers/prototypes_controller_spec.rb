require 'rails_helper'
require 'devise'

describe PrototypesController do
  let(:user) { create(:user) }
  let(:prototype) { create(:prototype, user: user)}
  let(:likes) { create_list(:like, 3, prototype: prototype, user: user) }

  describe "login user" do
    before do
      login_user user
    end

    # let(:prototypes) { create_list(:prototype, 3, user_id: user.id) }

    describe "GET #show" do
      before do
        get :show, params: { id: prototype }
      end

      it "assigns the requested prototype to @prototype" do
        expect(assigns(:prototype)).to eq prototype
      end

       it "assigns the requested prototype to @comment" do
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "assigns likes associated with prototype to @likes" do
        expect(assigns(:likes).to eq prototype.likes
      end


      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end
  end
end

