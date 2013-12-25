(function(global) {

// --- define ----------------------------------------------
// --- variable --------------------------------------------
// platform detection
//var _BROWSER = !!global.self;
//var _WORKER  = !!global.WorkerLocation;
var _NODE_JS = !!global.process;

// --- interface -------------------------------------------
function Class(arg) { // @arg Number:
    this._arg = arg;
}
Class.name = "Class";
Class.repository = "...";
Class.staticProperty = "LiteralValue";
Class.staticFunction = Class_staticFunction;    // Class.staticFunction(arg:Mix):Mix
Class.prototype.method = Class_method;          // Class#method(arg:String):String

// --- implement -------------------------------------------
function Class_staticFunction(arg) { // @arg Mix:
                                     // @ret Mix:
                                     // @help: Class.staticFunction
                                     // @desc:
    return arg;
}

function Class_method(arg) { // @arg String:
                             // @ret String:
                             // @help: Class#method
                             // @desc:
    return arg;
}

// --- export ----------------------------------------------
if (global.process) { // node.js
    module.exports = Class;
}
global.Class = Class;

})(this.self || global);


