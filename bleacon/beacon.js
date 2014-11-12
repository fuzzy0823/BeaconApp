var exec = require('child_process').exec;
Bleacon = require('bleacon');
Bleacon.startScanning();
exec('osascript LockMac.scpt',function(err,stdout,stderr){ });

Bleacon.on('discover',function(bleacon){
    console.dir(bleacon);
});
