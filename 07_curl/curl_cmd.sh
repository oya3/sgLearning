# 一覧を閲覧する。(GET)
curl https://learning.sonicgarden.jp/messages

# 新規登録(POST) user,text ※user,textにはURLエンコードが必要っぽい。勝手に変換してほしい。。。
curl https://learning.sonicgarden.jp/messages -X POST -d "message%5Buser%5D=user1234" -d "message%5Btext%5D=test1234"
curl https://learning.sonicgarden.jp/messages -X POST --data-urlencode "message[user]=user1234" --data-urlencode "message[text]=test1234"
# 登録した情報を閲覧する。(GET)
curl https://learning.sonicgarden.jp/messages/38

# 登録内容を編集する(POST -> PUT)
curl https://learning.sonicgarden.jp/messages/38 -X PUT -d "message%5Buser%5D=user1234.new" -d "message%5Btext%5D=test1234.new"
curl https://learning.sonicgarden.jp/messages/39 -X PUT --data-urlencode "message[user]=user1234.new2" --data-urlencode "message[text]=test1234.new2"

# 登録内容を削除する(POST -> DELETE)
curl https://learning.sonicgarden.jp/messages/38 -X DELETE

