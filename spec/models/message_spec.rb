require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid only with text' do
        message = build(:message, image: nil)
        expect(message).to be_valid
      end

      it 'is valid only with image' do
        message_c = create(:message, text: nil)
        message_b = build(:message, text: nil)
        # binding.pry
        expect(message_c).to be_valid
        expect(message_b).to be_valid
      end

      it 'is valid with both text and image' do
        message = build(:message)
        expect(message).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without text nor image' do
        message = build(:message, text: nil, image: nil)
        message.valid?
        expect(message.errors[:text]).to include("を入力してください")
      end

      it 'is invalid without group_id' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end

      it 'is invalid without user_id' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end
end