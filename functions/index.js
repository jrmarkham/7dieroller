const functions = require('firebase-functions');

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
const TIME = 15 * 1000;
// function delayUpdate(ms, func){
//     return new Promise(resolve=>{
//         return setTimeout(func,ms)
//     })
// }

exports.unlockAutoUpdate = functions.firestore
    .document('dieroller/main').onUpdate((change, context) => {
        const isLocked = change.after.data().locked;
        const update = ()=> change.after.ref.update({'locked':false});

        const timeUpdate =  setTimeout(update, TIME);
        console.log('isLocked ', isLocked);
        if(!isLocked){
            console.log('unref');
            return timeUpdate.unref();
        }

        console.log('running delay update');
        return new Promise(resolve => timeUpdate.ref());
    });