const { helper } = require("./encrypt.js");
const { connection } = require("./connection.js");
const { createTextEncrypted} = require("./createMagic.js");


function test() {
   helper();
   connection();
}

async () => {
   createTextEncrypted();
}


