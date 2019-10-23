class Category < ApplicationRecord
  acts_as_tree
  enum category: {
    レディース:1,メンズ:2,ベビー・キッズ:3,インテリア・住まい・小物:4,
    本・音楽・ゲーム:5,おもちゃ・ホビー・グッズ:6,コスメ・香水・美容:7,
    家電・スマホ・カメラ:8,スポーツ・レジャー:9,ハンドメイド:10,チケット:11,
    自動車・オートバイ:12,その他:13
  }
  #テスト用コード
  enum childrencategory: {
    トップス:1,ジャケットアウター:2,パンツ:3,スカート:4
  }

  enum grandchildcategory: {
    テスト:1, アウター:2
  }
end