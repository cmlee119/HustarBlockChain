pragma solidity ^0.4.18;

contract BookContract {

    uint8 numberOfBooks; // 총 제품의 수입니다.
    uint8 numberOfBookHistorys; // 총 제품의 수입니다.
    address contractOwner;

    struct myStruct {
        string bookId;
        string bookName;
        string bookWriter;
        string bookPublisher;
    }
    
    struct BookHistory {
        string bookId;
        string customerAddress; 
        uint date;
        uint flag;
    }

    myStruct[] bookInfo;
    BookHistory[] bookHistoryInfo;

    constructor() public {        
        contractOwner = msg.sender;
    }

    function addBookStru (string _firstString, string _secondString, string _thirdString, string _fourthString) public {
        bookInfo.push(myStruct(_firstString,_secondString, _thirdString, _fourthString)) -1;
        numberOfBooks++;
    }
    
    function addBookHistory (string strBookID, string strCustomerAddress, uint flag) public {
        bookHistoryInfo.push(BookHistory(strBookID, strCustomerAddress, now, flag)) -1;
        numberOfBookHistorys++;
    }

    //제품 등록의 수를 리턴합니다.
    function getNumOfBooks() public constant returns(uint8) {
        return numberOfBooks;
    }
    
    function getNumOfBookHistory() public constant returns(uint8) {
        return numberOfBookHistorys;
    }

    //번호에 해당하는 제품의 이름을 리턴합니다.
    function getbookStruct(uint _index) public view returns (string, string, string, string) {
        return (bookInfo[_index].bookId, bookInfo[_index].bookName, bookInfo[_index].bookWriter, bookInfo[_index].bookPublisher);
    }
    
    function getBookHistoryStruct(uint _index) public view returns (string, string, uint, uint) {
        return (bookHistoryInfo[_index].bookId, bookHistoryInfo[_index].customerAddress, bookHistoryInfo[_index].date, bookHistoryInfo[_index].flag);
    }

    //컨트랙트를 삭제합니다.
    function killContract() public {
        if(contractOwner == msg.sender)
            selfdestruct(contractOwner);
    }
}