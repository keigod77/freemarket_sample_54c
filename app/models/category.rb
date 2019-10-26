class Category < ApplicationRecord
  enum category: {
    レディース:1,メンズ:2,ベビー・キッズ:3,インテリア・住まい・小物:4,
    本・音楽・ゲーム:5,おもちゃ・ホビー・グッズ:6,コスメ・香水・美容:7,
    家電・スマホ・カメラ:8,スポーツ・レジャー:9,ハンドメイド:10,チケット:11,
    自動車・オートバイ:12,その他:13
  }
  #テスト用
  enum categorytest: {
    テストレディース:1
  }
  enum childrencategory: {
    テストレディース子:1
  }

  enum grandchildcategory: {
    テストレディース孫1:1,テストレディース孫2:2
  }
end