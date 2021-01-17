require 'rails_helper'

RSpec.describe Task, type: :model do
  # Taskに関するテストを書くグループ
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validation' do
    # Taskモデル内のバリデーションに関するテストを書くグループ
    it 'is valid with all attributes' do
        expect(build(:task)).to be_valid
    end
    # タイトルがなければ無効な状態であること
    it 'is invalid without title' do
        expect(build(:task, title: nil)).to be_invalid
        # expect(task.errors.messages[:title]).to include("can't be blank")
    end
    it 'is invalid without status' do
        # user = FactoryBot.build(:user)
        # task = FactoryBot.build(:task, status: nil)
        expect(build(:task, status: nil)).to be_invalid
        # expect(task.errors.messages[:status]).to include("can't be blank")
    end
    it 'is invalid with a duplicate title' do
      user = FactoryBot.create(:user)
      task = FactoryBot.build(:task)
      task.save
      # task2 = FactoryBot.build(:task)
      expect(build(:task)).to be_invalid
      # expect(task2.errors.messages[:title]).to include('has already been taken')
    end
    it 'is valid with another title' do
      user = FactoryBot.create(:user)
      task = FactoryBot.build(:task)
      task.save
      # task2 = FactoryBot.build(:task, title: 'title2')
      expect(build(:task, title: 'title2')).to be_valid
    end
  end
end
