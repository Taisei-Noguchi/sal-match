class Level < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'エンジョイ' },
    { id: 3, name: 'スタンダード' },
    { id: 4, name: 'ガチ' }
  ]
end
