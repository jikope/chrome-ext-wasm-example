"use strict";

(function() {
    var wasmPath = chrome.runtime.getURL("main.wasm")
    WebAssembly.instantiateStreaming(fetch(wasmPath)).then((w) => {
        console.log("loaded");
        // wasm = w;
        var ten = 10;
        // w.instance.exports.square_from_wasm();

        var squared = w.instance.exports.square_from_wasm(ten);
        console.log("Ten squared = " + squared);
    });
})();
