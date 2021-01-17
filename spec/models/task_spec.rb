require 'rails_helper'

RSpec.describe Task, type: :model do
  # Taskに関するテストを書くグループ
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validation' do
    # Taskモデル内のバリデーションに関するテストを書くグループ
    it 'is valid with all attributes' do
      task = build(:task)
      expect(task).to be_valid
      expect(task.errors).to be_empty
    end
    # タイトルがなければ無効な状態であること
    it 'is invalid without title' do
      task_without_title = build(:task, title: nil)
      expect(task_without_title).to be_invalid
      expect(task_without_title.errors.messages[:title]).to include("can't be blank")
    end
    it 'is invalid without status' do
        # user = FactoryBot.build(:user)
        # task = FactoryBot.build(:task, status: nil)
        task_without_status = build(:task, status: nil)
        expect(task_without_status).to be_invalid
        expect(task_without_status.errors.messages[:status]).to include("can't be blank")
    end
    it 'is invalid with a duplicate title' do
      # user = FactoryBot.create(:user)
      # task = FactoryBot.build(:task)
      # task.save
      # task2 = FactoryBot.build(:task)
      task = create(:task)
      task_with_duplicattion_title = build(:task, title: task.title)
      expect(task_with_duplicattion_title).to be_invalid
      expect(task_with_duplicattion_title.errors.messages[:title]).to include('has already been taken')
    end
    it 'is valid with another title' do
      # user = FactoryBot.create(:user)
      # task = FactoryBot.build(:task)
      # task.save
      # task2 = FactoryBot.build(:task, title: 'title2')
      task = create(:task)
      task_with_another_title = build(:task, title: 'another_title')
      expect(task_with_another_title).to be_valid
      expect(task_with_another_title.errors).to be_empty
    end
  end
end
