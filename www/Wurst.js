var exec = require('cordova/exec');

/* constructor */
function Wurst() {}

Wurst.prototype.dummy = function() {
        exec(
            function(reply){ alert('ok: '+reply);      },
            function(err){ alert('Error: '+err); }
        , "Wurst", "echoTest", ['dummy']);
}

Wurst.prototype.echoTest = function(str, callback) {
        exec(
            function(reply){ callback('ok: '+reply);      },
            function(err){ callback('Error: '+err); }
        , "Wurst", "echoTest", [str]);
};

Wurst.prototype.backgroundTest = function(str, callback) {
        exec(
            function(reply){ callback('ok: '+reply);      },
            function(err){ callback('Error: '+err); }
        , "Wurst", "backgroundJobTest", [str]);
};

var wurst = new Wurst();
module.exports = wurst;
