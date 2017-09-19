pragma solidity ^ 0.4 .11;
contract productLocation {

  struct Location {
    bytes32 productName;
    bytes32 location;
  }

  //proLoc proloc;
  mapping(uint => Location[]) geoloc;
  uint public prodCnt;
  uint public i;
  event test_value(uint256 indexed value1);
  address public creator;
    bytes32[10] bytesArray;

  function productLocation() {
    creator = msg.sender;
    prodCnt = 0;
    i = 0;
  }

  function addProdInfo(uint rfId, bytes32 _productName, bytes32 _location) public {

    geoloc[rfId].push(Location(_productName, _location));

    prodCnt++;
  }

  function getCount() public constant returns(uint) {
    return prodCnt;
  }

    function getrfIdCount(uint rfId) public constant returns(uint) {
      uint rfIdcnt = geoloc[rfId].length;
      return rfIdcnt;
    }

  function getProductDetails(uint rfId) public returns(bytes32[10]) {


    for (uint b = 0; b <= geoloc[rfId].length; b++) {
      bytesArray[b] = (geoloc[rfId][b].productName);
      bytesArray[b] = (geoloc[rfId][b].location);
    }
     return bytesArray;
  }

  function destroy() {
    if (msg.sender == creator) {
      suicide(creator);
    }

  }
}
