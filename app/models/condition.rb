class Condition < ActiveHash::Base
  self.data = [
    { id: 0, example: '新品・未使用' },
    { id: 1, example: '未使用に近い' },
    { id: 2, example: '目立った傷や汚れなし' },
    { id: 3, example: 'やや傷や汚れあり' },
    { id: 4, example: '傷や汚れあり' },
    { id: 5, example: '全体的に状態が悪い' }
  ]
end