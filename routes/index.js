var express = require('express');
const crypto = require('crypto');
var router = express.Router();
const debug = require('debug')('mycrypto:'+ __filename.replace(__dirname+ ( (__dirname.indexOf('/') > -1 )?'/':'\\'),""));

/* GET home page. */
router.get('/:_p', function(req, res, next) {
  var url = '', pass = '';
  url = req.query.u;
  pass = req.params._p;
  
  //var url1 = url.toString('base64')
  

  const secret = req.params._p;
  const hash = crypto.createHmac('sha256', secret)
                   .update(url)
                   .digest('hex');//.digest('base64')
  
  res.send('Url:-' + url + '<br/> Pass:- ' + pass + '<br/> hash:- ' + hash + '<br/> Base64:- ' + hash.toString('base64'));
});

module.exports = router;
