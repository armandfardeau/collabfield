# frozen_string_literal: true

require "rails_helper"

RSpec.describe FlashHelper, type: :helper do
  context "when displaying a flash notice" do
    before { flash[:success] = "Welcome to the Sample App!" }

    describe "#flash_helper" do
      it "returns a script tag" do
        expect(helper.flash_helper).to eq "<script>toastr.success('Welcome to the Sample App!');</script>"
      end
    end
  end

  context "when displaying multiple flash notices" do
    before do
      flash[:success] = "Welcome to the Sample App!"
      flash[:error] = "A sample error"
      flash[:notice] = "a sample notice"
    end

    describe "#flash_helper" do
      it "returns a script tag" do
        expect(helper.flash_helper).to eq "<script>toastr.success('Welcome to the Sample App!');</script>\n<script>toastr.error('A sample error');</script>\n<script>toastr.warning('a sample notice');</script>"
      end
    end
  end
end
