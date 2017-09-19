pragma solidity ^0.4.11;
contract greeter  {
    string greeting;

    function greeter(string _greeting) public {
        greeting = _greeting;
    }

    function changeGreeting(string _greeting) public {
        greeting = _greeting;
    }

    function greet() constant returns (string) {
        return greeting;
    }
}
