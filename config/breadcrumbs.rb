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

crumb :profile do
  link "プロフィール"
  parent :mypage
end

crumb :destroy do
  link "削除"
  parent :mypage
end

crumb :item_show do |item|
  link "#{item.name}"
  parent :root
end
