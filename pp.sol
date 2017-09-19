pragma solidity ^ 0.4 .11;
contract productLocation {

  struct Location {
    string productName;
    string location1;
  }

  //proLoc proloc;
  mapping(uint => Location[]) public geoloc;
  uint public prodCnt;
  uint public i;
  event test_value(uint256 indexed value1);
  address public creator;

  function productLocation() {
    creator = msg.sender;
    prodCnt = 0;
    i = 0;
  }

  function addProdInfo(uint rfId, string _productName, string _location) public {

    geoloc[rfId].push(Location(_productName, _location));

    prodCnt++;
  }

  function getCount() public constant returns(uint) {
    return prodCnt;
  }

  function getListOfProductDetails(uint rfId) internal returns(string[][1]) {
    string[][1] memory value2;
    for (uint b = 0; b <= geoloc[rfId].length; b++) {
      value2[b][0] = geoloc[rfId][b].productName;
      value2[b][1] = geoloc[rfId][b].location1;
      return value2;
    }
  }


  function printProductDetails() public returns(string memory pName, string memory pLocation) {
    return (pName, pLocation);
  }

  function destroy() {
    if (msg.sender == creator) {
      suicide(creator);
    }

  }
}
