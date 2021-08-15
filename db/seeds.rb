0.upto(30) do |idx|
  User.create(
    username: "テスト#{idx}",
    email: "#{idx}@#{idx}.com",
    password: "password",
    introduction: "#{idx}番目の人間です。"
  )
end