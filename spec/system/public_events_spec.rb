require "rails_helper"

RSpec.describe "PublicEvents", type: :system do
  let!(:event) { create(:event, title: "公開イベント") }

  it "公開一覧にイベントが表示される" do
    visit public_events_path

    expect(page).to have_content("公開イベント")
  end

  it "公開詳細に遷移できる" do
    visit public_events_path
    click_link "公開イベント"

    expect(page).to have_content("公開イベント")
    expect(page).to have_content("イベント説明")
  end

  it "論理削除されたイベントは表示されない" do
    create(:event, title: "非表示イベント", discarded_at: Time.current)

    visit public_events_path

    expect(page).not_to have_content("非表示イベント")
  end
end