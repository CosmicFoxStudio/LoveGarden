
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
    switch (_word) {
        case "o":
            return GenderInflectionHandleArticle(_gender);
        case "ele": case "dele": case "seu": case "meu":
            return GenderInflectionHandlePossessive(_word, _gender);
        default:
            return GenderInflectionHandle(_word, _gender);
    }
}

// Function to handle special case for the word "o"
function GenderInflectionHandleArticle(_gender) {
    switch (_gender) {
        case e_pronouns.ELA:
            return "a";
        case e_pronouns.ELU:
            return "ê";
		case e_pronouns.ELE:
        default:
            return "o"; // Masculine pronouns - no change
    }
}

// For special cases in the neutral language (words that end with "que")
function GenderInflectionHandleQueGue(_word, _gender, _queGue) {
	var replacement = "";
	switch (_gender) {
	    case e_pronouns.ELA:
			if (_queGue == "co") {
		        replacement = "ca";
			}
			else if (_queGue == "go") {
				replacement = "ga";	
			}
		break;
	    case e_pronouns.ELU:
			if (_queGue == "co") {
		        replacement = "que";
			}
			else if (_queGue == "go") {
				replacement = "gue";	
			}
		break;

		case e_pronouns.ELE:
	    default:
	        return _word; // Masculine pronouns - no change
	}
		
	// Get the length of the string
	var strLength = string_length(_word);

	// Replace the last three letters with something else
	var slicedString = string_copy(_word, 1, strLength - 2);
	
	var modifiedString = slicedString + replacement;

	// Return the modified string to original function
	return modifiedString;
}

/* For words such as:
	"yours"/"his"/"hers"/"theirs"
	"tu"/"su"/"suyo"/"de ella"/"de él"
	"seu"/"sua"/"sue"/"dele"/"dela"/"delu"
*/
function GenderInflectionHandlePossessive(_word, _gender) {
	var replacement = "";
	switch (_gender) {
	    case e_pronouns.ELA:
			if (_word == "ele") {
		        replacement = "ela";
			}
			else if (_word == "dele") {
				replacement = "dela";
			}
			else if (_word == "esse") {
		        replacement = "essa";
			}
			else if (_word == "seu") {
				replacement = "sua";
			}
			else if (_word == "meu") {
				replacement = "minha";
			}
		break;
		
	    case e_pronouns.ELU:
			if (_word == "ele") {
		        replacement = "elu";
			}
			else if (_word == "dele") {
				replacement = "delu";
			}
			else if (_word == "esse") {
		        replacement = "êssu";
			}
			else if (_word == "seu") {
				replacement = "sue";
			}
			else if (_word == "meu") {
				replacement = "minhe";
			}
		break;
		
		case e_pronouns.ELE:
	    default:      
	        return _word; 
	}
	
	var modifiedString = replacement;

	// Return the modified string to original function
	return modifiedString;
	
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
	switch (_gender) {
	    case e_pronouns.ELA:
	        replacement = "a";
	        break;
	    case e_pronouns.ELU:
	        replacement = "e";
	        break;
			
		case e_pronouns.ELE:
	    default:
	        return _word; // Masculine pronouns - no change
	}
	
	// Modify the last character based on the gender
	var modifiedWord = ReplaceLastNChar(_word, 1, replacement);
	
	return modifiedWord;
}

// Replace the last occurrence of a given character in a word
function ReplaceSpecifiedLastChar(_word, _char, _replacement) { // e.g.: ReplaceSpecifiedLastChar(_word, "o", replacement);
    var lastIndex = string_length(_word);
    
    while (lastIndex > 0) {
        lastIndex--;

        if (string_char_at(_word, lastIndex + 1) == _char) {
            return string_copy(_word, 1, lastIndex) + _replacement + string_copy(_word, lastIndex + 2, string_length(_word) - lastIndex - 1);
        }
    }

    return _word;
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
