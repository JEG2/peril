require 'spec_helper'

describe ViewedEvent do
  it "sets the viewed flag before a save" do
    answer = FactoryGirl.create(:answer)
    event  = FactoryGirl.build(:viewed_event, answer: answer)
    expect(answer.viewed_at).to be_nil
    event.save!
    expect(answer.viewed_at).not_to be_nil
  end

  it "unsets the viewed flag when destroyed" do
    event = FactoryGirl.create(:viewed_event)
    expect(event.answer.viewed_at).not_to be_nil
    event.destroy
    expect(event.answer.viewed_at).to be_nil
  end

  it "quitely does nothing when the answer is removed before the event" do
    event = FactoryGirl.create(:viewed_event)
    event.answer.destroy
    expect do
      event.reload.destroy
    end.not_to raise_error(Exception)
  end
end
