var crypto = require('crypto');
var _ = require('lodash');

hexo.extend.helper.register('avatarUrlOfMember', function(name) {
  var members = hexo.locals.get('data').members;

  var member = _.find(members, function(item) {
    return _.some(item.name, function(itemName) {
      return name == itemName;
    });
  });

  return avatarUrl(member);
});

hexo.extend.helper.register('ageOfMember', function(member) {
  if (member.profile && member.profile.birthday)
    return Math.floor((Date.now() - new Date(member.profile.birthday).getTime()) / (365 * 24 * 3600 * 1000));
  else
    return null;
});

hexo.extend.helper.register('domainOfUrl', function(url) {
  return url.match(/https?:\/\/([^/]+)/)[1];
});

hexo.extend.helper.register('avatarUrl', avatarUrl);

function avatarUrl(member, size) {
  if (size)
    size = '?s=' + size;
  else
    size = '';

  if (!member)
    return '//cdn.v2ex.com/gravatar';
  else if (!member.avatar)
    return '//cdn.v2ex.com/gravatar';
  else if (member.avatar.match(/^http/))
    return member.avatar;
  else if (member.avatar.match(/^[a-f0-9]{32}$/))
    return '//cdn.v2ex.com/gravatar/' + member.avatar + size;
  else if (member.avatar)
    return '//cdn.v2ex.com/gravatar/' + md5(member.avatar) + size;
  else if (member.email)
    return '//cdn.v2ex.com/gravatar/' + md5(member.email) + size;
  else
    return '//cdn.v2ex.com/gravatar';
}

function md5(message) {
  return crypto.createHash('md5').update(message).digest('hex');
}
