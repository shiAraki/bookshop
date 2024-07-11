namespace my.bookshop;

using
{
    Currency,
    managed,
    sap,
    cuid
}
from '@sap/cds/common';

entity Books : managed
{
    key ID : Integer;
    title : localized String(111);
    descr : localized String(1111);
    stock : Integer;
    price : Decimal(9,2);
    currency : Currency;
    authors : Association to one Authors;
}

entity Authors : managed
{
    key ID : Integer;
    name : String(111);
    books : Association to many Books on books.authors = $self;
}

entity Orders : cuid, managed {
  OrderNo  : String @title:'Order Number'; //> readable key
  Items    : Composition of many OrderItems on Items.parent=$self;
}

entity OrderItems {
  key parent : Association to Orders;
  key book   : Association to Books;
  amount     : Integer;
}