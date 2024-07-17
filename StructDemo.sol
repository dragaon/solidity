// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract StructDemo{
    struct Book{
        string title;
        string author;
        uint8 book_id;
        string publisher;
    }

    Book book;

    function setBook() public{
        book =Book('Learn Solidity', 'ACC', 100,'Emerald');
    }

    function getBookId() public view returns (uint8){
        return book.book_id;
    }

    function getBookName() public view returns (string memory){
        return book.title;
    }

    function getAuthor() public view returns (string memory){
        return book.author;
    }

    function getPublisher() public view returns (string memory){
        return book.publisher;
    }
}