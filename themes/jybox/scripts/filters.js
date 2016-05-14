var Promise = require('bluebird');
var request = Promise.promisify(require('request'));

hexo.extend.filter.register('before_generate', function() {
  return request({
    url: 'https://jysperm.me/blogs.json',
  }).then(function(res) {
    hexo.locals.set('blogs', JSON.parse(res.body));
  });
});

hexo.extend.filter.register('before_generate', function() {
  return request({
    url: 'https://jysperm.me/tweets.json',
  }).then(function(res) {
    hexo.locals.set('tweets', JSON.parse(res.body));
  });
});
