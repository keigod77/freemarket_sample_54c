crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", top_mypage_path
  parent :root
end

crumb :profile do
  link "プロフィール", profile_mypage_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_mypage_path
  parent :mypage
end

#mypage/add_card /card の二つで使う
crumb :card do
  link "支払い方法"
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_home_index_path
  parent :mypage
end
