crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path(current_user)
  parent :root
end

crumb :logout do
  link "ログアウト"
  parent :mypage
end

crumb :credit_card do
  link "クレジットカード情報入力"
  parent :mypage
end
