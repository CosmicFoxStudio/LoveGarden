function HandleGenderInflection(_str, _gender) {
    var openTag = "<";
    var closeTag = ">";
	var word = "";
    // Find the position of the opening tag
    var openPos = string_pos(openTag, _str);

    // Iterate through the string until no more < > tags are found (string_pos returns 0 to "<")
	while (openPos > 0) {

        // Find the position of the closing tag
        var closePos = string_pos(closeTag, _str);
		
        // Check if both tags are found
        if (closePos > openPos) {
	        // Extract the word between the tags
	        var word = string_copy(_str, openPos + 1, closePos - openPos - 1);
		
		    // Check if the word ends with "co" to replace it to "que" in neutral gender
		    var isQue = (string_copy(word, string_length(word) - 1, 2) == "co");
			// Check if the word ends with "go" to replace it to "gue" in neutral gender
			var isGue = (string_copy(word, string_length(word) - 1, 2) == "go");
			
			// Handle special case for words ending with "que"
		    if (isQue) word = HandleQueGueInflection(word, _gender, "co");
			else if (isGue) word = HandleQueGueInflection(word, _gender, "go");
		    else if (word == "ele" || word == "dele" || word == "seu" || word == "meu") {
		        // Handle special case for "delu"
		        word = HandlePossessiveInflection(word, _gender);
			}
			else if (word == "o") {
				word = HandleArticleInflection(_gender);
			} else {
		        // Handle default inflection (o/a/e/ê)
		        word = ApplyDefaultInflection(word, _gender);
		    }
		
			// Replace the original word in the string and return it
			_str = ReplaceWord(_str, word);
		}
		
        // Update to the next occurrence of the opening tag and loop again
        openPos = string_pos(openTag, _str);
		//if (openPos == 0) { show_debug_message("while loop condition break") }
	}
	// Once there's no more <> tags, the loop breaks and the new string with all substitutions is returned
    return _str;
}

// Function to handle special case for the word "o"
function HandleArticleInflection(_gender) {
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
function HandleQueGueInflection(_word, _gender, _queGue) {
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

// For words such as "seu"/"sua"/"sue", or "dele"/"dela"/"delu"
function HandlePossessiveInflection(_word, _gender) {
	var replacement = "";
	switch (_gender) {
	    case e_pronouns.ELA:
			if (_word == "ele") {
		        replacement = "ela";
			}
			else if (_word == "dele") {
				replacement = "dela";
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

/// On selected <words>, "o" becomes "a" or "e" depending on chosen pronouns
function ApplyDefaultInflection(_word, _gender) {

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
	

	// This code doesn't work for words with repeated letters
	//var substring = string_char_at(_word, string_length(_word));
    //var modifiedWord = string_replace(_word, substring, replacement);
	
	// Modify the last character based on the gender
	var modifiedWord = ReplaceLastChar(_word, "o", replacement);
	
	return modifiedWord;
}

// Replace the last occurrence of a character in a word
function ReplaceLastChar(_word, _char, _replacement) {
    var lastIndex = string_length(_word);
    
    while (lastIndex > 0) {
        lastIndex--;

        if (string_char_at(_word, lastIndex + 1) == _char) {
            return string_copy(_word, 1, lastIndex) + _replacement + string_copy(_word, lastIndex + 2, string_length(_word) - lastIndex - 1);
        }
    }

    return _word;
}

function ReplaceWord(_str, _modifiedWord) {
	var openTag = "<";
    var closeTag = ">";
	// Find the position of the opening and closing tags
    var openPos = string_pos(openTag, _str);
    var closePos = string_pos(closeTag, _str);
	var originalWord = string_copy(_str, openPos + 1, closePos - openPos - 1);
	
	// Replace the original word in the string
    _str = string_replace(_str, openTag + originalWord + closeTag, _modifiedWord);

    return _str;
}
