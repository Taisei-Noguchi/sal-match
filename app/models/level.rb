class Level < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'エンジョイ（初心者）' },
    { id: 3, name: 'スタンダード（中級者）' },
    { id: 4, name: 'ガチ（上級者）' }
  ]
end
