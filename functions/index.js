const functions = require('firebase-functions');

const TIME = 15 * 1000;

exports.unlockAutoUpdate = functions.firestore
    .document('dieroller/main').onUpdate((change, context) => {
        const isLocked = change.after.data().locked;
        const update = ()=> change.after.ref.update({'locked':false});

        const timeUpdate =  setTimeout(update, TIME);
        console.log('isLocked ', isLocked);
        if(!isLocked){
            console.log('unref -- stop timer');
            return timeUpdate.unref();
        }

        console.log('running delay update to unlock api');
        return new Promise(resolve => timeUpdate.ref());
    });