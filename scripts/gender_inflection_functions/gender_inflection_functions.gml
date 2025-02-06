/// Define a struct for handling the idiomatic exceptions
/// Left column is how you should write the word in the dialogue tags
global.genderExceptionRules = {
	"o"		: ["e", "a", "o"],
	"x"		: ["ê", "a", "o"],
	"ele"	: ["elu", "ela", "ele"],
	"dele"	: ["delu", "dela", "dele"],
    "co"	: ["que", "ca", "co"],
	"go"	: ["gue", "ga", "go"],
	"seu"	: ["sue", "sua", "seu"],
	"meu"	: ["minhe", "minha", "meu"],
	"esse"	: ["êssu", "essa", "esse"]
};

/// Main function to handle gender inflection
function GenderInflection(_str, _gender) {
    var openTag = "<";
    var closeTag = ">";
    
	// Iterate through the string until no more < > tags are found (string_pos returns 0 to "<")
    while (string_pos(openTag, _str) > 0) {
        var word = GenderInflectionExtractWord(_str, openTag, closeTag);
        _str = ReplaceWord(_str, GenderInflectionHandleWord(word, _gender));
    }

	// Once there's no more <> tags, the loop breaks and the new string with all substitutions is returned
    return _str;
}

/// Extract word between opening and closing tags
function GenderInflectionExtractWord(_str, _openTag, _closeTag) {
	// Find the position of the opening tag and closing tag
    var openPos = string_pos(_openTag, _str);
    var closePos = string_pos(_closeTag, _str);
    
	// Check if both tags are found
    if (closePos > openPos) {
        return string_copy(_str, openPos + 1, closePos - openPos - 1);
    }

    return "";
}

/// Handle inflection for a single word
function GenderInflectionHandleWord(_word, _gender) {
	// Word is an exception - indexed on dictionary
	if (variable_struct_exists(global.genderExceptionRules, _word)) {
		return global.genderExceptionRules[$ _word][_gender];
	}
	
	// Regular words with gender inflection
	return GenderInflectionHandle(_word, _gender);
}

/// Handle inflection for words ending with "o", as well as "que" or "gue" depending on chosen pronouns
function GenderInflectionHandle(_word, _gender) {
    // Check if the word ends with "co" to replace it to "que" in neutral gender
    var isQue = (string_copy(_word, string_length(_word) - 1, 2) == "co");
    // Check if the word ends with "go" to replace it to "gue" in neutral gender
    var isGue = (string_copy(_word, string_length(_word) - 1, 2) == "go");

    if (isQue) {
        return GenderInflectionHandleQueGue(_word, _gender, "co");
    } else if (isGue) {
        return GenderInflectionHandleQueGue(_word, _gender, "go");
    } else {
		// Handle default inflection (o/a/e)
        return GenderInflectionHandleDefault(_word, _gender);
    }
}

/// On selected <words>, "o" becomes "a" or "e" depending on chosen pronouns
function GenderInflectionHandleDefault(_word, _gender) {
	var replacement = "";
	if (global.genderExceptionRules[$ "o"] != undefined && global.genderExceptionRules[$ "o"][_gender] != undefined) {
        replacement = global.genderExceptionRules[$ "o"][_gender];
    }
	
	// Modify only the last character based on the gender
	var modifiedWord = ReplaceLastNChar(_word, 1, replacement);
	
	return modifiedWord;
}

// For special cases in the neutral language (words that end with "que")
function GenderInflectionHandleQueGue(_word, _gender, _queGue) {
	var replacement = "";
    if (global.genderExceptionRules[$ _queGue] != undefined && global.genderExceptionRules[$ _queGue][_gender] != undefined) {
        replacement = global.genderExceptionRules[$ _queGue][_gender];
    }

	// Get the length of the string
	var strLength = string_length(_word);

	// Replace the last two letters with something else
	var slicedString = string_copy(_word, 1, strLength - 2);
	
	var modifiedString = slicedString + replacement;

	// Return the modified string to original function
	return modifiedString;
}

// Function to replace the last n characters of a word
function ReplaceLastNChar(_word, _n, _replacement) {
    var lastIndex = string_length(_word);
    return string_copy(_word, 1, lastIndex - _n) + _replacement;
}

function ReplaceWord(_str, _modifiedWord) {
	var openTag = "<";
    var closeTag = ">";
	// Find the position of the opening and closing tags
    var openPos = string_pos(openTag, _str);
    var closePos = string_pos(closeTag, _str);
	var originalWord = string_copy(_str, openPos + 1, closePos - openPos - 1);
	
	// Replace the original word in the string
    return string_replace(_str, openTag + originalWord + closeTag, _modifiedWord);
}
