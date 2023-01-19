require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John',
      photo: 'https://picsum.photos/200/300',
      bio: 'Teacher from Nigeria',
      posts_counter: 0
    )
  end

  before { subject.save }

  describe 'Validations' do
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a photo' do
      subject.photo = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a bio' do
      subject.bio = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if name is too short' do
      subject.name = 'Jo'
      expect(subject).to_not be_valid
    end

    it 'is not valid if name is too long' do
      subject.name = 'John' * 30
      expect(subject).to_not be_valid
    end

    it 'is not valid if bio is too short' do
      subject.bio = 'Jo'
      expect(subject).to_not be_valid
    end

    it 'is not valid if bio is too long' do
      subject.bio = 'John' * 1001
      expect(subject).to_not be_valid
    end

    it 'is not valid if name is not unique' do
      user2 = User.new(name: 'John', photo: 'https://www.google.com', bio: 'This is a bio')
      expect(user2).to_not be_valid
    end

    it '@user.fetch_recent_posts returns 3 posts' do
      User.create(
        name: 'John Doe',
        photo: 'https://picsum.photos/200/300',
        bio: 'Teacher from Nigeria',
        posts_counter: 0
      )
    end

    it 'should return user last 3 posts' do
      User.create(
        name: 'John Doe',
        photo: 'https://picsum.photos/200/300',
        bio: 'Teacher from Nigeria',
        posts_counter: 0
      )
    end
  end
end
