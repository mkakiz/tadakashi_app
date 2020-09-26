# README

本アプリのコンセプト：

タダカシは無料の物々交換サービスです。<br/>
キャンプ用具や芝刈り機やパーティグッズなど、<br/>
いつもは使わないけど後日使う物は売りたくない。<br/>
それなら無料でシェアしませんか？がコンセプトです。<br/>

URL:<br/>
http://tadakashi.com <br/>

機能リスト：<br/>
・ユーザー登録<br/>
・記事投稿（テキスト、画像、地図情報）<br/>
・いいね<br/>
・自ユーザーページでいいねした記事一覧表示<br/>
・記事検索<br/>

利用の流れ：
1. 貸せる物を投稿（テキスト+写真+交換場所または郵送先）
2. 借りたい物にコメントして日時や交換方法などについて確認
3. 合意後に交換
貸せる物が多いほど相手から何かを借りられるチャンスが多くなるメリットがあります。<br/>
また、物（キャンプ道具など）から同じ趣味の人（キャンプ好き）と繋がれるのも利点です。

制作の理由：<br/>
「こんなサービスがあったら使いたい」と思ったのがキッカケです。<br/>
「断捨離」という言葉が流行っているように、誰でも意外と使っていない物を持っているものです。<br/>
もう2度と使わないと確信できるなら売却してもいいでしょうが、後で使いそうなものは売ってしまうのはもったいないです。<br/>
自分が使わない間は誰かに貸して、しかも相手が使ってないものを無料で使えればより豊かになれると思い制作しました。<br/>

AWS設計図：<br/>
![AWS_structure](https://user-images.githubusercontent.com/52940447/94350914-58488300-0021-11eb-8c84-77b24bbb71e6.jpg) <br/>

環境・使用技術：<br/>
・Ruby 2.6.3<br/>
・Rails 5.2.4、RSpec<br/>
・MySQL2<br/>
・AWS（EC2、RDS for MySQL、Route53、CloudWatch）<br/>
・Nginx、Unicorn<br/>
・Docker<br/>
・Terraform<br/>
・CircleCI (CD/CI)<br/>
