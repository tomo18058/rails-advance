require "rails_helper"

RSpec.describe Event, type: :model do
  it "有効な値があれば有効である" do
    event = Event.new(
      title: "テストイベント",
      description: "イベント説明",
      held_on: Date.today,
      organizer_name: "主催者",
      target_department: "高校生"
    )

    expect(event).to be_valid
  end

  it "titleがなければ無効である" do
    event = Event.new(
      title: nil,
      description: "イベント説明",
      held_on: Date.today,
      organizer_name: "主催者",
      target_department: "高校生"
    )

    expect(event).to be_invalid
    expect(event.errors[:title]).to be_present
  end

  it "descriptionがなければ無効である" do
    event = Event.new(
      title: "テストイベント",
      description: nil,
      held_on: Date.today,
      organizer_name: "主催者",
      target_department: "高校生"
    )

    expect(event).to be_invalid
  end

  it "held_onがなければ無効である" do
    event = Event.new(
      title: "テストイベント",
      description: "イベント説明",
      held_on: nil,
      organizer_name: "主催者",
      target_department: "高校生"
    )

    expect(event).to be_invalid
  end

  it "organizer_nameがなければ無効である" do
    event = Event.new(
      title: "テストイベント",
      description: "イベント説明",
      held_on: Date.today,
      organizer_name: nil,
      target_department: "高校生"
    )

    expect(event).to be_invalid
  end

  it "target_departmentがなければ無効である" do
    event = Event.new(
      title: "テストイベント",
      description: "イベント説明",
      held_on: Date.today,
      organizer_name: "主催者",
      target_department: nil
    )

    expect(event).to be_invalid
  end

  describe ".kept" do
    it "discarded_atがnilのレコードのみ取得する" do
      kept_event = Event.create!(
        title: "表示イベント",
        description: "説明",
        held_on: Date.today,
        organizer_name: "主催者",
        target_department: "高校生"
      )

      deleted_event = Event.create!(
        title: "削除イベント",
        description: "説明",
        held_on: Date.today,
        organizer_name: "主催者",
        target_department: "高校生",
        discarded_at: Time.current
      )

      expect(Event.kept).to include(kept_event)
      expect(Event.kept).not_to include(deleted_event)
    end
  end
end