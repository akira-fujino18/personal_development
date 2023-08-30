User.create!([
  {
    name: "テスト太郎",
    email: "taro.tanaka@example.com",
    password: "111111",
    self_introduction: "五十文字以上の自己紹介を作って！とChat GPTにお願いしたら、明らかに五十文字に満たない文章を送ってきた。何故の所業なのか"
  }
])

user = User.first

Skill.create!([
  {
    user_id: user.id,
    category_id: 1,
    level: 40,
    name: "Ruby"
  },
  {
    user_id: user.id,
    category_id: 1,
    level: 50,
    name: "PHP"
  },
  {
    user_id: user.id,
    category_id: 1,
    level: 60,
    name: "C++"
  },
  {
    user_id: user.id,
    category_id: 1,
    level: 80,
    name: "JAVA"
  },
  {
    user_id: user.id,
    category_id: 2,
    level: 40,
    name: "React"
  },
  {
    user_id: user.id,
    category_id: 3,
    level: 40,
    name: "AWS"
  },
  {
    user_id: user.id,
    category_id: 2,
    level: 50,
    name: "Vue"
  },
  {
    user_id: user.id,
    category_id: 2,
    level: 30,
    name: "JavaScript"
  },
  {
    user_id: user.id,
    category_id: 3,
    level: 50,
    name: "Docker"
  }
])

Category.create!([
  {
    name: "バックエンド"
  },
  {
    name: "フロントエンド"
  },
  {
    name: "インフラ"
  }
])
