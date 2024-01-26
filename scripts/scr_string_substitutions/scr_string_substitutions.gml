// For words such as "seu"/"sua"/"sue", or "dele"/"dela"/"delu"
function HandleGenderInflection(_str, _gender) {
    var openTag = "<";
    var closeTag = ">";
	var word = "";
    // Find the position of the opening and closing tags
    var openPos = string_pos(openTag, _str);
    //var closePos = string_pos(closeTag, _str);

    // Iterate through the string until no more < > tags are found
	while (openPos > 0) {

        // Find the corresponding closing tag
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
		    if (isQue) word = HandleQueInflection(word, _gender);
		    else if (word == "ele" || word == "dele" || word == "seu" || word == "meu") {
		        // Handle special case for "delu"
		        word = HandlePossessiveInflection(word, _gender);
			}
			else if (word == "o") {
				switch (_gender) {
					case e_pronouns.ELA:
					    word = "a";
					break;
					case e_pronouns.ELU:
					    word = "ê";
					break;	
				}
			} else {
		        // Handle default inflection (o/a/e/ê)
		        word = ApplyDefaultInflection(word, _gender);
		    }
		
			// Replace the original word in the string and return it
			_str = ReplaceWord(_str, word);
		}
		
        // Find the next occurrence of the opening tag
        openPos = string_pos(openTag, _str);
		//if (openPos == 0) { show_debug_message("Condition Break") }
	}
	// Once there's no more <> tags, the loop breaks and the new string with all substitutions is returned
    return _str;
}

// For special cases in the neutral language (words that end with "que")
function HandleQueInflection(_word, _gender) {
	var replacement = "";
	switch (_gender) {
	    case e_pronouns.ELA:
	        replacement = "ca";
	        break;
	    case e_pronouns.ELU:
	        replacement = "que";
	        break;

	    default:
	        // Masculine pronouns - no change
	        return _word;
	}
		
	// Get the length of the string
	var strLength = string_length(_word);

	// Replace the last three letters with something else
	var slicedString = string_copy(_word, 1, strLength - 2);
	
	var modifiedString = slicedString + replacement;

	// Return the modified string to original function
	return modifiedString;
}

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
		
	    default:
	        // Masculine pronouns - no change
	        return _word;
	}
	
	var modifiedString = replacement;

	// Return the modified string to original function
	return modifiedString;
	
}

/// On selected <words>, "e" becomes "a" or "o" depending on chosen pronouns
function ApplyDefaultInflection(_word, _gender) {

	var replacement = "";
	switch (_gender) {
	    case e_pronouns.ELA:
	        replacement = "a";
	        break;
	    case e_pronouns.ELU:
	        replacement = "e";
	        break;

	    default:
	        // Masculine pronouns - return with no changes
	        return _word;
	}
	
    // Modify the last character based on the gender
    var modifiedWord = string_replace(_word, string_char_at(_word, string_length(_word)), replacement);
	
	return modifiedWord;

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
