var inputString;
var index1;
var errorflag;

$(document).ready( function() {

	$('button#input-string').click(function() {
		grammar();
	})



});

function grammar(){
	index1 = 0;
	errorflag = 0;
	inputString = document.getElementById("input").value;
		    
	if(inputString[inputString.length - 1] === "$"){
	Start_scan();
	} else {
	confirm("Not a valid string! $ sign is missing. ");
	}
};

// Function for digit
function Digit(){
	if ((Token() === '0') || (Token() === '1') || (Token() === '2') || (Token() === '3') ){
		validate_token(Token());
	} else {
		Error();
	}
};

// function for non terminal factor
function Factor(){
	if(Token() === '('){
		validate_token(Token());
		Expr();
		validate_token(')');
	}
	else if ((Token() === '0') || (Token() === '1') || (Token() === '2') || (Token() === '3')){
		Digit();
	} else {
		Error();
	}
};

// function for non terminal term
function Term(){
	Factor();
	while((Token() === '*') || (Token() === '/')){
		if(Token() === '*'){
			validate_token(Token());
			Factor();
		}
		else if(Token() === '/'){
			validate_token(Token());
			Factor();
		} else {
			Error();
		}
	}
};

//
function Token(){
	return(inputString[index1]);
};

// function to increment pointer
function Inc_pointer(){
	if (index1 < (inputString.length - 1)){
		index1++;
	}
};

// function to validate token
function validate_token(T){
	if (T === Token()){
		Inc_pointer();
	} else {
		Error();
	}
};

// function for terminal expr
function Expr(){
	Term();
	while((Token() === '+') || (Token() === '-')){
		if(Token() === '+'){
			validate_token(Token());
			Term();
		}
		else if(Token() === '-'){
			validate_token(Token());
			Term();
		} else {
			Error();
		}
	}
};

// Function for error handling
function Error(){
	confirm("Error found at position: " + index1);
	errorflag = 1;
	Inc_pointer();
};

// function to start lexical scanning
function Start_scan()
{
	Expr();
	validate_token('$');
	if (errorflag === 0){
		confirm("legal");
	} else {
	confirm("Errors found" + "\n");
	}
};