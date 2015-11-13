---
title: '提交内容'
permalink: contributing
---

精子粉丝团主页大部分文本内容使用 Markdown 编写，结构化数据使用 YAML 编写，由 [Hexo](https://hexo.io) 生成静态站点，源代码托管于 [Github](https://github.com/jysperm/jybox.net).

如果你希望自助式地提交内容，可以 Fork 源代码的仓库，修改特定文件后提交 Pull Request, 注意保持新内容的格式与现有内容一致，不要提交无关的修改。

如果你不会使用上述工具，可联系精子帮助你修改。

## 提交推荐语/印象

请修改 [source/_data/comments.yml](https://github.com/jysperm/jybox.net/blob/master/source/_data/comments.yml) 这个文件，在末尾加上你的名字、头衔和内容，名字请和 `members.yml` 中保持一致，这样头像才会被正确地显示；该文件中不支持使用 HTML 或 Markdown.

因为这部分内容会出现在首页最主要的位置，因此精子会对每一条内容进行审阅并提出修改意见，直到质量达到可以出现在首页的水平。

## 提交 FAQ

请在 [jybox.net/issue](https://github.com/jysperm/jybox.net/issues) 中提交你的问题，精子会撰写回答并将其添加到网站上。

一个问题是否被接受主要取决于是否有很多人关心这个问题，精子可能会对问题进行适当的修改以符合回答。

## 提交粉丝成员

请修改 [source/_data/members.yml](https://github.com/jysperm/jybox.net/blob/master/source/_data/members.yml) 这个文件，在末尾加上你资料，下面有一份字段说明：

    name:
      # 你的名字，其中 display 是必选的，其他字段都是可选的
      display: '王子亭'
      nickname: '精子'
      ascii: 'jysperm'
    # 你的头像，可以填邮件地址或 MD5 值，会使用 Gravatar 上的头像
    # 或者你也可以填写 URL, 但注意必须是 https 的地址，且足够稳定
    avatar: 'jysperm@gmail.com'
    # 你的博客地址
    blog: 'https://jysperm.me'
    # 你的网站
    websites:
      -
        name: 'Atom 中文社区'
        url: 'http://atom-china.org'
    profile:
      # 你的公司名字和可选的链接
      company:
        name: 'LeanCloud'
        url: 'https://leancloud.cn'
      # 目前居住地
      location: 'Toronto'
      # 生日，可以只写年份
      birthday: '1993-09-20'
    # 你最有代表性的一些标签，请优先选用他人已有的标签
    tags:
      - Node.js
      - Atom
      - 退学党
    # 各个社交网络的账号
    sns:
      github: 'jysperm'
      qq: '184300584'
      v2ex: 'jybox'
      zhihu: 'jysperm'
      segmentfault: 'jysperm'
      twitter: 'jysperm'
      bitcoin: '13v2BTCMZMHg5v87susgg86HFZqXERuwUd'
      keybase: 'jysperm'

除了 `name.display` 和 `avatar` 之外，其他字段都是可选的，支持的字段也在随时变化中，你可以参考 `members.yml` 中其他人的写法，或者你认为可以添加一些新的字段，也可以在 Pull Request 中提出。注意你在这里提交的信息可能会永远存在于互联网上，请只提交你认为可以公开的信息。

精子可能会随时从资料中删除信息，例如已经过时的信息，或已经失效的链接，但精子不会为你添加信息，所以请时不时来修订一下你的资料。

## 有关信息使用的注意事项

* 你提交的信息将会被公开在粉丝团主页和位于 Github 上的源代码仓库中，包括你提交的历史纪录、Issue 和 Pull Request 中的讨论。
* 除非你有特别的理由（例如不小心提交了涉及隐私的信息），否则精子不会从网站或代码仓库中删除你提交的信息。
* 在未征得提交者同意的情况下，你不可以使用其他人提交的信息，这些信息的相关权利仍属于提交者。
* 请只提交自己的资料，不要提交未经授权的他人的资料。
