var locale = [];

/**
 * Format {string} to first letter uppercase.
 *
 * @param {string} args The string we want localized
 * @return {string} Returns the localized string
 */
function _U() {
    var args = arguments;
    var string = args[0];

    // Was a string specified?
    if (!string) {
        console.log('locale.js: no string was parsed');
        return 'locale.js: no string was parsed';
    }

    // Has the locale file been set?
    if (locale.length == 0) {
        console.log('locale.js: no locale has been set');
        return 'locale.js: no locale has been set';
    }

    // Does the translation exist?
    if (!locale[string]) {
        string = 'en';
    }

    // Do we need to format the string?
    if (args.length == 1) {
        return capitalize(locale[string]);
    } else {
        return formatString(args);
    }
}

function formatString(args) {
    var string = capitalize(locale[args[0]]);

    for (var i = 1; i < args.length; i++) {
        string = string.replace(/%s/, args[i]);
    }

    return string;
}

function capitalize(string) {
    return string[0].toUpperCase() + string.slice(1);
}

// https://stackoverflow.com/a/35359503
String.prototype.format = function () {
    var args = arguments;
    return this.replace(/{(\d+)}/g, function (match, number) {
        return typeof args[number] != 'undefined'
            ? args[number]
            : match
            ;
    });
};
