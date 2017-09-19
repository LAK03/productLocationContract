pragma solidity ^0.4.11;
contract productLocation_exp  {

	struct Location {
		string productName;
		string location;
	}

	//proLoc proloc;
	mapping (uint => Location) geoloc;
        uint public prodCnt;
        uint public i  ;
	event test_value(uint256 indexed value1);
	address public creator;
	function productLocation() {
		creator = msg.sender;
		prodCnt = 0;
		i = 0;
	}
	function addProdInfo(uint rfId,string _productName, string _location) public  {
	Location l = geoloc[rfId];
	l.productName = _productName;
	l.location=_location;

 	prodCnt++;
	}

	function getCount() public constant returns(uint) {
		return prodCnt;
	}

  function getProductDetails(uint rfId) returns(string productName,string location ) {

		productName = geoloc[rfId].productName;
		location = geoloc[rfId].location;


	}

	function destroy() {
		if(msg.sender == creator) {
			suicide(creator);
		}

	}
}
