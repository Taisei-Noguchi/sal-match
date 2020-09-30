class Field < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '体育館' },
    { id: 3, name: '屋外人工芝' },
    { id: 4, name: '屋外天然芝' },
    { id: 5, name: '屋外土' },
    { id: 6, name: '屋外コンクリート' },
    { id: 7, name: '屋内人工芝' },
    { id: 8, name: '屋内天然芝' },
    { id: 9, name: '屋内土' },
    { id: 10, name: '屋内コンクリート' }
  ]
end
