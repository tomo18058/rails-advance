require "rails_helper"

RSpec.describe "AdminEvents", type: :system do
  let!(:admin_user) do
    AdminUser.create!(
      email: "admin@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  it "管理者がログインしてイベントを作成できる" do
    visit new_admin_session_path

    fill_in "メール", with: "admin@example.com"
    fill_in "パスワード", with: "password"
    click_button "ログイン"

    visit new_admin_event_path

    fill_in "タイトル", with: "管理イベント"
    fill_in "説明", with: "管理画面で作成"
    fill_in "開催日", with: "2026-04-20"
    fill_in "主催者名", with: "管理者"
    fill_in "対象学科", with: "高校生"
    click_button "登録"

    expect(page).to have_content("管理イベント")
  end
end