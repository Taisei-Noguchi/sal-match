class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '対戦チーム募集' },
    { id: 3, name: 'チーム参加者募集' },
    { id: 4, name: '個サル'}
  ]
end
