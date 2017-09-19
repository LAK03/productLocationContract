pragma solidity ^ 0.4 .11;
contract productLocation {

  struct Location {
    string productName;
    string location;
  }

  //proLoc proloc;
  mapping(uint => Location[]) geoloc;
  uint public prodCnt;
  uint public i;
  uint rfIdcnt;
  string[10] loc;
  string[10] pName;
  event test_value(uint256 indexed value1);
  address public creator;

  function productLocation() {
    creator = msg.sender;
    prodCnt = 0;
    i = 0;
    rfIdcnt =0;
  }

  function addProdInfo(uint rfId, string _productName, string _location) public {

    geoloc[rfId].push(Location(_productName, _location));

    prodCnt++;
  }


  function getCount() public constant returns(uint) {
    return prodCnt;
  }


    function setArray(string[10] incoming,uint rfId)  // NOTE 2 see below. Also, use enough gas.
    {
    	setarraysuccessful = 0;
    	uint8 x = 0;
        while(x < rfIdcnt)
        {
          loc[x] =geoloc[rfId][x].location;
          pName[x] = geoloc[rfId][x].productName;
        	x++;
        }
        setarraysuccessful = 1;
    	return;
    }
    function getArraySettingResult() constant returns (string)
  {
    return setarraysuccessful;
  }

  function getArray() constant returns (string[10],string[10])  // NOTE 3 see below
  {
    return (loc,pName);
  }
    function getrfIdCount(uint rfId) public constant returns(uint) {
       rfIdcnt = geoloc[rfId].length;
      return rfIdcnt;
    }

  function getProductDetails(uint rfId,uint b) public returns(string[]) {

    return  geoloc[rfId][b].location;


  }

  function destroy() {
    if (msg.sender == creator) {
      suicide(creator);
    }

  }
}
